class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.5.0"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.5.0/tradecli-v0.5.0-darwin-arm64.tar.gz"
      sha256 "d7c682279ce7be9fc7f513ca5bf48e3036c4804585a83f3b43964ca5608c9b7f"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.5.0/tradecli-v0.5.0-linux-x64.tar.gz"
    sha256 "530df8ba25bfbb40846c941e1379cd9f21b9f2db85249a2daa24d3066cc0502f"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
