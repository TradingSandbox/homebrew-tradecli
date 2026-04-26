class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.10"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.10/tradecli-v0.3.10-darwin-arm64.tar.gz"
      sha256 "f4edef7133b667ca02fde98337bf385f056b36f5a303e3e9f734f85a2292a757"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.10/tradecli-v0.3.10-linux-x64.tar.gz"
    sha256 "f0deff93484d4a5c0397e9cdb2f2f4e67c995e3e5a37426b5036a5fd4a6ccacd"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
