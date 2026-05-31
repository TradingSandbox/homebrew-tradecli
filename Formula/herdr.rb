class Herdr < Formula
  desc "Agent-aware terminal multiplexer"
  homepage "https://github.com/ogulcancelik/herdr"
  version "0.6.2"
  license "AGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ogulcancelik/herdr/releases/download/v0.6.2/herdr-macos-aarch64"
      sha256 "4cf22522e31ed386312551e71d4c5ff90ad84fbf066207a0554c6bba6bfa010e"
    else
      url "https://github.com/ogulcancelik/herdr/releases/download/v0.6.2/herdr-macos-x86_64"
      sha256 "73f33d783d05204e94222192079d03fde1cd0b0927987c8aad115e5b02154f47"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ogulcancelik/herdr/releases/download/v0.6.2/herdr-linux-aarch64"
      sha256 "088a574c3d72e28529e750be0e92982c0d4b0cfd7f8d60404fe1a29f65df575b"
    else
      url "https://github.com/ogulcancelik/herdr/releases/download/v0.6.2/herdr-linux-x86_64"
      sha256 "9ee85178a0a0db1fd1524328e91bc37b57c25400eeba4d0a6bb2f1beb63a0089"
    end
  end

  def install
    binary = Dir["herdr-*"].first
    chmod 0755, binary
    bin.install binary => "herdr"
  end

  test do
    assert_match "herdr 0.6.2", shell_output("#{bin}/herdr --version")
  end
end
