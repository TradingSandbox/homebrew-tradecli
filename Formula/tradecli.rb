class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.4/tradecli-v0.3.4-darwin-arm64.tar.gz"
      sha256 "2b4659f86a87b1f6d7afcce020006aff3d3cce8087a718bcc90076b5ddf44a7c"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.4/tradecli-v0.3.4-linux-x64.tar.gz"
    sha256 "a66ac8cc9a68a104d6fbc8900b46bb6949af479f68f058bc0ab5b9373b72638f"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
