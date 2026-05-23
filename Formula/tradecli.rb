class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.5.1"

  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.5.1/tradecli-v0.5.1-darwin-arm64.tar.gz"
      sha256 "63f0076e5b2d58193df9f14eb3af1d084327a7522fd6e444172fd7fdd378d555"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.5.1/tradecli-v0.5.1-linux-x64.tar.gz"
    sha256 "a3a309a6c904220d5e6820e2f9008c7695bb3cfc3f4a8de870a43b066bf703b7"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
