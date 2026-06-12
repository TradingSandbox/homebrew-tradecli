# Generated from templates/ai-trading-office.rb.erb. Edit the template, not this file.
class AiTradingOffice < Formula
  desc "Office lifecycle state service for TradingSandbox"
  homepage "https://github.com/TradingSandbox/homebrew-tradecli"
  version "0.1.1"

  bottle do
    root_url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/ai-trading-office-v0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "90287b52202f96661563ccb2e2567d9f4b7970663a20b94d6eb600d9408597c8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d2492014bc5c8acddc6686b3f9d985e85074dde1cc07f8c5397e442532b27b12"
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/ai-trading-office-v0.1.1/ai-trading-office-v0.1.1-darwin-arm64.tar.gz"
      sha256 "41679a030c0f915616b09dd9d3e02acba2629994a9004724eccbf1a6470b8f63"
    end
  end

  on_linux do
    url "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/ai-trading-office-v0.1.1/ai-trading-office-v0.1.1-linux-x64.tar.gz"
    sha256 "d01aefbb78d181fc21797dcc112e35289cd53ed18d89ef74e3f1e44d69d37a60"
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
