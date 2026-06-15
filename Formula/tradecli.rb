# Generated from templates/tradecli.rb.erb. Edit the template, not this file.
class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.10"

  bottle do
    root_url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.10"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2bebcc4ec1a764bc8200ebd1d65302b8161003f394c56409aebd1f4d232d63f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7dba2e1468c2244bc53e4adb177567e874e4d7b2479c36333815d5b38ac46740"
  end

  depends_on "ai-trading-office"
  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.10/tradecli-v0.6.10-darwin-arm64.tar.gz"
      sha256 "331b79ec170fc36ee90b1cda631f18a270cc523de83ae46b5aa825c4493db3d2"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.10/tradecli-v0.6.10-linux-x64.tar.gz"
    sha256 "b91e786b094f1230b930471a4e0b19e0910dad245f1d5ad657222fd368eae02c"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
