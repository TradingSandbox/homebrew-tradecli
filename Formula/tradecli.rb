# Generated from templates/tradecli.rb.erb. Edit the template, not this file.
class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.8"

  bottle do
    root_url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "71eac2f2f8c414263d4f6dd9d535a9b4ddf3a8502ff3cdbb3e6323c8100662d2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5f6853e060e837dc84fd368dad629d40b8ca5b903a71f541958e2c90247659ae"
  end

  depends_on "ai-trading-office"
  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.8/tradecli-v0.6.8-darwin-arm64.tar.gz"
      sha256 "e2633104ad6dafb35845f996a0921a7bbbff377f86fbbc511aeaca875c56a8a6"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.8/tradecli-v0.6.8-linux-x64.tar.gz"
    sha256 "7dcc6c15a3986d287ca6be87d4b22b2e0de8e5dc59deb595063b45a10d689cd6"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
