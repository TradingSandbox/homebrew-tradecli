class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.3.13"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.13/tradecli-v0.3.13-darwin-arm64.tar.gz"
      sha256 "c5458c6d4e8c650a447bc79b1bb411b65c1c57c6bf5259d43844d6b1e1be7719"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.3.13/tradecli-v0.3.13-linux-x64.tar.gz"
    sha256 "3146aa8dfb4dbc8cf7f9224351edb52d6eb6dfbdd49c8cadd0008066593a05f5"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
