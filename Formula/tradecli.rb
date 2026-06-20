# Generated from templates/tradecli.rb.erb. Edit the template, not this file.
class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.13"

  bottle do
    root_url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.13"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "57b9a32ed9f349c830bdd46f5c757eab2ac1068d2104897bc12bbda25a409025"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "007bfc546018087e861279ca31a91710d0df2777910eb3096fdbfed13def9bc7"
  end

  depends_on "ai-trading-office"
  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.13/tradecli-v0.6.13-darwin-arm64.tar.gz"
      sha256 "b56e9c846648eb2ce128026d3938d6342c37f83c81d1d54a6bb05225ff5e59bc"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.13/tradecli-v0.6.13-linux-x64.tar.gz"
    sha256 "0ea155d2effd1a4115c7c8610e090c6135729efba3d8049245f160c1885c79c0"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
