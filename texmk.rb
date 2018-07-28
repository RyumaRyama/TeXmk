REPOSITORY_URL="https://github.com/RyumaRyama/homebrew-texmk"
HOMEBREW_TEXMK_VERSION="0.0.1"

class Texmk < Formula
  desc ""
  homepage REPOSITORY_URL
  url "https://github.com/RyumaRyama/homebrew-texmk.git"
  version HOMEBREW_TEXMK_VERSION
  sha256 ""
  head 'https://github.com/RyumaRyama/homebrew-texmk.git', :branch => 'master'

  skip_clean 'bin'

  def install
    bin.install "bin/texmk"
    bin.install "bin/tab"
  end

  test do
    system "false"
  end
end
