class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.5/tradecli-v0.3.5-darwin-arm64.tar.gz"
      sha256 "45dd2c30f9f00090ee84a2305f07bf07b6ab7ae4db7747acb61b3501832069f0"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.5/tradecli-v0.3.5-linux-x64.tar.gz"
    sha256 "8fa161f9527d6fb774a61a2d3cf65fe82f0c1588b52e4450bf8ed5eb1f2dddf0"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
