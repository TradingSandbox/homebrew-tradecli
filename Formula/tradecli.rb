class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.0"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.0/tradecli-v0.6.0-darwin-arm64.tar.gz"
      sha256 "2df4c290eef50d5cdb1f0e34bc32cedd4edf4741b19e76be54d949f405afb4a4"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.0/tradecli-v0.6.0-linux-x64.tar.gz"
    sha256 "0c081a7453ff8e1bae28f471cdc4690ae0d0ff427314aed93a1778530856499e"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
