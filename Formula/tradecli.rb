# Generated from templates/tradecli.rb.erb. Edit the template, not this file.
class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.9"

  bottle do
    root_url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "cf8eb5c4755ae35e08e1eeee85fc8695f68d06055b940b9b7378f9265b664494"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "53db6be1dfabdb4ed04ba55766b4d9125b97d0b8df3b66fa5fdffd452b50be05"
  end

  depends_on "ai-trading-office"
  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.9/tradecli-v0.6.9-darwin-arm64.tar.gz"
      sha256 "0c763a557caa93683ae53c96b4cb84d3ad582363d0d1921386287dc4584be298"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.9/tradecli-v0.6.9-linux-x64.tar.gz"
    sha256 "3f7b75598097fc1ad022d5e4bb83fd4b4afb671216d67fee0e98632d1db3fc6c"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
