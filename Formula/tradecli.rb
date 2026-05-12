class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.15"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.15/tradecli-v0.3.15-darwin-arm64.tar.gz"
      sha256 "423c47e5bb3d8ab17b6a98093359c9036c7fb9d8f92f9e39a70178fc7f2e9923"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.15/tradecli-v0.3.15-linux-x64.tar.gz"
    sha256 "d37a9a0e9e54dcb5eb85e6acaa23c6ed45fd150e3c366ad0de8dca234347029e"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
