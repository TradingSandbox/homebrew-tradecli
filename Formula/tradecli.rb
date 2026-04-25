class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.8"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.8/tradecli-v0.3.8-darwin-arm64.tar.gz"
      sha256 "734e0b81e4fd08d9865a62f3a6782914d0833fa507ec8d584834201b0be465b4"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.8/tradecli-v0.3.8-linux-x64.tar.gz"
    sha256 "e49b57d2db6f4126707ff09346c259820397a82fb31b7a16da8b287f8bb58049"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
