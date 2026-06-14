# Generated from templates/tradecli.rb.erb. Edit the template, not this file.
class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.6"

  bottle do
    root_url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "022b9499ab43a73ffeda5d3a14a36c5a890762fcafe5ffa2d73967c35544fa25"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "274d7b029739165aaca42a73217e628791bff54f1326df81a322a00a5194c770"
  end

  depends_on "ai-trading-office"
  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.6/tradecli-v0.6.6-darwin-arm64.tar.gz"
      sha256 "32dae374ef9fb4d5bb2d2fa4b2fb7e6384d038c542a5684f0cf4a5a27b885919"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.6/tradecli-v0.6.6-linux-x64.tar.gz"
    sha256 "c8b0fd72f5894ca12b52765ebf3374524f09fb2d668183d244cc72f47c7658c8"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
