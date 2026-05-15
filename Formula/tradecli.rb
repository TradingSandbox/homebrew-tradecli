class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.17"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.17/tradecli-v0.3.17-darwin-arm64.tar.gz"
      sha256 "f80e1b2dc2358d238a5d03de96bdf5bbe432b75d0e3261318c3e50a7e4142811"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.17/tradecli-v0.3.17-linux-x64.tar.gz"
    sha256 "4f76e4c6829d697c15e968f2480e1e5e9135bca9bff7fc66d7aba2d1f72a17a1"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
