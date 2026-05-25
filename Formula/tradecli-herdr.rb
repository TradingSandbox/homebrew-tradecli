class TradecliHerdr < Formula
  desc "Agent-aware terminal multiplexer packaged for tradecli"
  homepage "https://github.com/TradingSandbox/herdr"
  version "0.6.2-tradecli.2"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/herdr/releases/download/v0.6.2-tradecli.2/herdr-macos-aarch64"
      sha256 "b7e7586cbc4ead36f48777287b92dd581ddd346b6574aa0c4ca336752938d346"
    else
      url "https://github.com/TradingSandbox/herdr/releases/download/v0.6.2-tradecli.2/herdr-macos-x86_64"
      sha256 "f0358ac2543b67cb3fe6d8d7228528448eec8f3af4913618baefd55ef7d4cc0f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/herdr/releases/download/v0.6.2-tradecli.2/herdr-linux-aarch64"
      sha256 "52080c00186a79cdb21167e9efca94c413d51f8acde2c682ee46a87ecb239f82"
    else
      url "https://github.com/TradingSandbox/herdr/releases/download/v0.6.2-tradecli.2/herdr-linux-x86_64"
      sha256 "71386a5dd0c6b9844fd2cb3746e17ae80e40d44fbfab907d5c8f1740214323c5"
    end
  end

  def install
    binary = Dir["herdr-*"].first
    chmod 0755, binary
    bin.install binary => "tradecli-herdr"
  end

  test do
    assert_match "herdr 0.6.2-tradecli.2", shell_output("#{bin}/tradecli-herdr --version")
  end
end
