# Generated from templates/tradecli.rb.erb. Edit the template, not this file.
class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.3"

  depends_on "ai-trading-office"
  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.3/tradecli-v0.6.3-darwin-arm64.tar.gz"
      sha256 "88ffb85af4636e40e0f05631afaa1f122c8693335feb7fe50b99b364a13ccd64"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.3/tradecli-v0.6.3-linux-x64.tar.gz"
    sha256 "b6092ad947c23485c1e6c171888486197d9b470f3c2ea7b5a796a80fec32a5c8"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
