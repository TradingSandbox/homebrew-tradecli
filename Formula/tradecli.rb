class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.7"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.7/tradecli-v0.3.7-darwin-arm64.tar.gz"
      sha256 "cffafb67bbf13caabf8fe1792a2e175f88cf6ec66b1e992cf0df7295e07680b4"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.7/tradecli-v0.3.7-linux-x64.tar.gz"
    sha256 "7bdf9354b3b84dc329913c4ec56e9b5bdb468501981a24d3fea1a27656f24feb"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
