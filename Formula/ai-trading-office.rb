# Generated from templates/ai-trading-office.rb.erb. Edit the template, not this file.
class AiTradingOffice < Formula
  desc "Office lifecycle state service for TradingSandbox"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.1.2"

  bottle do
    root_url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/ai-trading-office-v0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "407e0f6fc09fe2084b2b0357ef61c4571a7ae989673f4fd35ab01efcfd269935"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "172705ae2296d83fce9805222c5be97138d819ff164456bacf9166d2c7f13ec9"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/ai-trading-office-v0.1.2/ai-trading-office-v0.1.2-darwin-arm64.tar.gz"
      sha256 "26e5f1d7e558b2eaf23913c8c8b254218a8a6b751b9e705e42760fad83ee256e"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/ai-trading-office-v0.1.2/ai-trading-office-v0.1.2-linux-x64.tar.gz"
    sha256 "502162173698d17b8a0b8fd204c350aed258033382eb512696891c7f8ab2f44e"
  end

  def install
    payload = (buildpath/"ai-trading-office").directory? ? buildpath/"ai-trading-office" : buildpath
    libexec.install Dir[payload/"*"]
    bin.install_symlink libexec/"ai-trading-office"
  end

  service do
    run [opt_bin/"ai-trading-office", "serve"]
    keep_alive true
    working_dir var
    log_path var/"log/ai-trading-office.log"
    error_log_path var/"log/ai-trading-office.log"
    environment_variables AITO_HOST: "127.0.0.1", AITO_PORT: "8787"
  end

  test do
    assert_match "ai-trading-office", shell_output("#{bin}/ai-trading-office --version 2>&1")
  end
end
