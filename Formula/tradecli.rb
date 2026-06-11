# Generated from templates/tradecli.rb.erb. Edit the template, not this file.
class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.2"

  depends_on "ai-trading-office"
  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.2/tradecli-v0.6.2-darwin-arm64.tar.gz"
      sha256 "711b2788dadf1dd92a8db68fdd1bc0b37d48bf41468e687e219e65d97a18e7fe"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.2/tradecli-v0.6.2-linux-x64.tar.gz"
    sha256 "e0d39173ed8019b2dbf3304b34ae2167dcfd69f2e2004683c7a0e9311e0007cd"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
