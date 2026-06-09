# Generated from templates/tradecli.rb.erb. Edit the template, not this file.
class Tradecli < Formula
  desc "AI trading assistant for the Indian stock market"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.6.1"

  depends_on "herdr"
  depends_on "node"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.1/tradecli-v0.6.1-darwin-arm64.tar.gz"
      sha256 "030c5780219db66d37d91a4b04e9607c2df5a8f9cb1a1ac5824a77f7a752ec44"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.1/tradecli-v0.6.1-linux-x64.tar.gz"
    sha256 "f7c5fa5d673a53d912551d24dfe64ad903dfaad09d460f744fcfacbfbb42f833"
  end

  def install
    bin.install "tradecli"
  end

  test do
    assert_match "tradecli", shell_output("#{bin}/tradecli --version 2>&1", 0)
  end
end
