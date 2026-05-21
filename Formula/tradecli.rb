class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.4.0"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.4.0/tradecli-v0.4.0-darwin-arm64.tar.gz"
      sha256 "78491d26d921cb71af51623d9a986598b458d1413d3970ee9a009eccc1ffeaf9"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.4.0/tradecli-v0.4.0-linux-x64.tar.gz"
    sha256 "ab4435059193614e9e813a3240b19ed73b064bf648e91bd1bee2ef204eba9b0e"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
