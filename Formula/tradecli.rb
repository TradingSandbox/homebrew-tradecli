class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.6/tradecli-v0.3.6-darwin-arm64.tar.gz"
      sha256 "1d03425044843721dfe65c2cb47147358c563e3b172576891d3629112e67ab5c"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.6/tradecli-v0.3.6-linux-x64.tar.gz"
    sha256 "8b287a85ecd02547560d9888cb3f0bd831764eb02c4936ee19cc36c6ea7fafc3"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
