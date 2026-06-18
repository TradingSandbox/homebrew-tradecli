# Generated from templates/tradecli.rb.erb. Edit the template, not this file.
class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.12"

  bottle do
    root_url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.12"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "66e4a92b24c3b496b20bd8b8eeb4be4cacc6ae25dc1da919b887052a1d1401f9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "18252862b632404a4574abbfb955042fc12d59c7a8b5cacc57128f78677f73cd"
  end

  depends_on "ai-trading-office"
  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.12/tradecli-v0.6.12-darwin-arm64.tar.gz"
      sha256 "7a001761b7654da599c197bf9a93f1c15062e73a3f579a692c37f528dbb8a353"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.12/tradecli-v0.6.12-linux-x64.tar.gz"
    sha256 "ec064c24c62ed12b5aa3fe480b471584f8e2076f544ed6c2ca7c81b54bb52925"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
