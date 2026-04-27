class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.11"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.11/tradecli-v0.3.11-darwin-arm64.tar.gz"
      sha256 "4adce4371d9663370e3876c3487aa2a1139204ff69f1de1af7ee7d019786739a"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.11/tradecli-v0.3.11-linux-x64.tar.gz"
    sha256 "c87cd247cd194807574a8bdbce2456efce64a41d484036d7f8f39b1cd0e134fc"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
