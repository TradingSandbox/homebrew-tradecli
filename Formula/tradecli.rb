class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.5.2"

  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.5.2/tradecli-v0.5.2-darwin-arm64.tar.gz"
      sha256 "022c208470515834d6a77bd453481514f7122d78ad4490188dfa763ab01558af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.5.2/tradecli-v0.5.2-linux-x64.tar.gz"
      sha256 "60933083b030641f430f3fc1ca7c555f65735b53e43e89b72822e40cdfbe4a41"
    end
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1")
  end
end
