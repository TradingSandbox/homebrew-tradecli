class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.9"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.9/tradecli-v0.3.9-darwin-arm64.tar.gz"
      sha256 "10a9b310acfff4982793c3d99b4d67cf3c8b03b3bdf49e53dc55df7eefd43a86"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.9/tradecli-v0.3.9-linux-x64.tar.gz"
    sha256 "58032e3fed9aea667bd643e8efddf9d61c1e0c688fb3947e45945f2310674e7d"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
