# texmk
latexmkを用いてテンプレートからレポートを作成することができ，ターミナルからコマンドを叩くことでそのままemacsやvimなど，好みのエディタで編集することができるシェルスクリプトです．

## 使用環境
環境としては以下の2つを用意すれば何とかなる気がします．
* latexmk
* Skim

これらで気持ちよくTeXが書けます．

### latexmk
    which latexmk
としてなければインストールします．
その後ホームディレクトリにて`.latexmkrc`という名前で次のような設定ファイルを作成します．
```
#!/usr/bin/env perl
$latex            = 'platex -synctex=1 -halt-on-error';
$latex_silent     = 'platex -synctex=1 -halt-on-error -interaction=batchmode';
$bibtex           = 'pbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode	    = 3; # generates pdf via dvipdfmx

# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
$pvc_view_file_via_temporary = 0;

# Use Skim as a previewer
$pdf_previewer    = "open -ga /Applications/Skim.app";
```

こちらのサイトを参考にしました．
https://qiita.com/Rumisbern/items/d9de41823aa46d5f05a8

### Skim
上記参考サイトにもあったように，Skimを使用することでTeXファイルを監視，保存時に自動更新をしてくれます．
一度Skim内の環境設定において自動更新の設定を行う必要があります．
Skim: https://skim-app.sourceforge.io


## TeXのテンプレートファイル
このスクリプトではTeXのテンプレートファイルを読み込み，編集ファイルを生成します．編集したいファイルを直接指定すれば編集することができますが，何も指定しなければテンプレートが呼び出されます．
そのテンプレートの置き場所に関しては，次のようにお願いします．

    ~/.TeXTemplate/*.tex

\*については任意の名前で構いません．


## 使用方法
このスクリプトの使用方法は二種類あります．
1. 新規作成
2. 編集

の二点になります．


作業用ディレクトリを作成し，そのなかで，

    % texmk [作成したいファイル名]

と実行することで新規作成されます．
テンプレートからデータが読み込まれるため，テンプレートファイルを用意していない場合はうまく実行されません．
またファイル名は.texを付けなくても自動で付きます．付けても良いです．

編集については.texのファイルを指定することっでそれをそのまま編集することができます．
これも拡張子を付けなくても動きます．

実行後はlatexmkが実行されているタブとは別に新規のタブが開くため，そこでemacsなりvimなりで編集できます．もちろん他のエディタを使用しても構いません．

編集後はlatexmkのタブに戻り，`ctrl+c`で実行を停止してください．
