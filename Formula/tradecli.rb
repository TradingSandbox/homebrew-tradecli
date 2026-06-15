# Generated from templates/tradecli.rb.erb. Edit the template, not this file.
class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.11"

  bottle do
    root_url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.11"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c25fa85422a42aaccfd8ac7a3da3fb127c32e5dd345233dafe82ef870489a379"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5db30271699a2ff822fcc7cfb0a66669b0f643681d67e45627ed6649a140282e"
  end

  depends_on "ai-trading-office"
  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.11/tradecli-v0.6.11-darwin-arm64.tar.gz"
      sha256 "9e0043cea76a7a5dfe66e25cec3e145eb1ecbe1be606051ca9ce4a8e2985d538"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.11/tradecli-v0.6.11-linux-x64.tar.gz"
    sha256 "fde1a13c43d0197d5e6b44147545def90a05875d6194988f4f2f589792934ae9"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
