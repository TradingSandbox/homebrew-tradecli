class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.16"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.16/tradecli-v0.3.16-darwin-arm64.tar.gz"
      sha256 "85d4a338ab018884086562709b57640ed8c255fae0d20cbba45b1efa766a6e52"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.16/tradecli-v0.3.16-linux-x64.tar.gz"
    sha256 "f4017a033bf6fc4f6165876d9e0e8d1be16d717cecb19feb00f3dacc6fedf0b5"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
