# Generated from templates/ai-trading-office.rb.erb. Edit the template, not this file.
class AiTradingOffice < Formula
  desc "Office lifecycle state service for TradingSandbox"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.1.3"

  bottle do
    root_url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/ai-trading-office-v0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4cbdd9dce8d076291d8b92c3533ad1721a67a83fd5c12e4cbd7823b6dcb8cb1a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "98bf49637253faa75c5aa47bd8174706ac78c717e882cbca6ec581117298844f"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/ai-trading-office-v0.1.3/ai-trading-office-v0.1.3-darwin-arm64.tar.gz"
      sha256 "eef885f490da00d72cb54696f6fbdac276bca78031a3f3899846f1398d7c92b9"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/ai-trading-office-v0.1.3/ai-trading-office-v0.1.3-linux-x64.tar.gz"
    sha256 "7de9e1fb9dcb3f226c9a3f7c3a5eb6298937bf1e190d6cf4d61832aae46cfec6"
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
