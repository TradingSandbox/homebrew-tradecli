# Generated from templates/tradecli.rb.erb. Edit the template, not this file.
class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.7"

  bottle do
    root_url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "55cd53ee5fe4ef1efbaa2b08884e914849121b1ed7588accfdc3756e56f04cb7"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3435965b3f81a4c6530407693201595f33c6a65c646a11600d2a2558aa5af517"
  end

  depends_on "ai-trading-office"
  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.7/tradecli-v0.6.7-darwin-arm64.tar.gz"
      sha256 "0d6d1ff5914ed276d570e14d419707363ab422a2392f39bd8d836f2c020b6b67"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.7/tradecli-v0.6.7-linux-x64.tar.gz"
    sha256 "9ccb50f2d2594ed966b561894e055cd28c2b8015620b60deb309f0f544691954"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
