# Generated from templates/ai-trading-office.rb.erb. Edit the template, not this file.
class AiTradingOffice < Formula
  desc "Office lifecycle state service for TradingSandbox"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/ai-trading-office-v0.1.0/ai-trading-office-v0.1.0-darwin-arm64.tar.gz"
      sha256 "91760de773c220e3a959648c00ad01e73d94178d68228ce5deca2ba31513d238"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/ai-trading-office-v0.1.0/ai-trading-office-v0.1.0-linux-x64.tar.gz"
    sha256 "ea0f0484b773e1bd9945f032d35967e8b7a48f9b0275928333ca5afcfc9d458f"
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
