# Generated from templates/tradecli.rb.erb. Edit the template, not this file.
class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.4"

  depends_on "ai-trading-office"
  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.4/tradecli-v0.6.4-darwin-arm64.tar.gz"
      sha256 "3129dab4079b00a38029e1fba8d54e66a1e35e348fc29976958844472e91ca04"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.4/tradecli-v0.6.4-linux-x64.tar.gz"
    sha256 "b55da8aba616527fb256b0585164b5888379d2be1fc7554b136671a2e9cf0ec2"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
