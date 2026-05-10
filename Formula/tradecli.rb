class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.14"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.14/tradecli-v0.3.14-darwin-arm64.tar.gz"
      sha256 "ee27074d049595d7178fa27e696a30c7cf2896bb4ca8f36db091aae7f7d17641"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.14/tradecli-v0.3.14-linux-x64.tar.gz"
    sha256 "012495e0f7b011185235fd3c8b64ea0d8b7d66b94b999cc07ef7d7532a350466"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
