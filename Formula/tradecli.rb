class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.12"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.12/tradecli-v0.3.12-darwin-arm64.tar.gz"
      sha256 "12b3abbc72da61d874f9c48eed26c4d673d0ea46670a6de4cd2a07b7cb4c8856"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.12/tradecli-v0.3.12-linux-x64.tar.gz"
    sha256 "1c1fab5f52bb65c9a6756fe7eb1b52351d3ce7e9dbf44545d29fa171fa4991e0"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
