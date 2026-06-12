# Generated from templates/tradecli.rb.erb. Edit the template, not this file.
class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.5"

  bottle do
    root_url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6d02056a206760e743a0f03a888473455a7e366d199b71e9b183ca29b332b0f5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0c10a63b363fb75de6a07f67029dce905068bede892609916e521a4c6d578b74"
  end

  depends_on "ai-trading-office"
  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.5/tradecli-v0.6.5-darwin-arm64.tar.gz"
      sha256 "c499e8adedf602264723ed5dedd282414befa534feffd41bfd127455c4a1f550"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.5/tradecli-v0.6.5-linux-x64.tar.gz"
    sha256 "806cd154b1362b309920140e05a4d544d2e48823bf6345237542c3455bb0d2e4"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
