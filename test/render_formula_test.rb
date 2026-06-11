# frozen_string_literal: true

require "minitest/autorun"
require "json"
require "open3"
require "tmpdir"

class RenderFormulaTest < Minitest::Test
  ROOT = File.expand_path("..", __dir__)

  def test_renders_tradecli_formula_from_tap_owned_template
    Dir.mktmpdir("tradecli-formula-") do |dir|
      output = File.join(dir, "tradecli.rb")

      stdout, stderr, status = Open3.capture3(
        "ruby",
        File.join(ROOT, "scripts/render-formula.rb"),
        "--tag", "v0.6.1",
        "--darwin-arm64-sha", "a" * 64,
        "--linux-x64-sha", "b" * 64,
        "--output", output,
        chdir: ROOT,
      )

      assert status.success?, "expected render script to succeed\nSTDOUT: #{stdout}\nSTDERR: #{stderr}"

      formula = File.read(output)
      assert_includes formula, "# Generated from templates/tradecli.rb.erb. Edit the template, not this file."
      assert_includes formula, 'version "0.6.1"'
      assert_includes formula, 'depends_on "herdr"'
      assert_includes formula, 'depends_on "node"'
      assert_includes formula, "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.1/tradecli-v0.6.1-darwin-arm64.tar.gz"
      assert_includes formula, "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/v0.6.1/tradecli-v0.6.1-linux-x64.tar.gz"
      assert_includes formula, %(sha256 "#{"a" * 64}")
      assert_includes formula, %(sha256 "#{"b" * 64}")
    end
  end

  def test_renders_ai_trading_office_formula_from_tap_owned_template
    Dir.mktmpdir("office-formula-") do |dir|
      output = File.join(dir, "ai-trading-office.rb")

      stdout, stderr, status = Open3.capture3(
        "ruby",
        File.join(ROOT, "scripts/render-office-formula.rb"),
        "--tag", "ai-trading-office-v0.1.0",
        "--version", "0.1.0",
        "--darwin-arm64-sha", "c" * 64,
        "--linux-x64-sha", "d" * 64,
        "--output", output,
        chdir: ROOT,
      )

      assert status.success?, "expected render script to succeed\nSTDOUT: #{stdout}\nSTDERR: #{stderr}"

      formula = File.read(output)
      assert_includes formula, "# Generated from templates/ai-trading-office.rb.erb. Edit the template, not this file."
      assert_includes formula, 'class AiTradingOffice < Formula'
      assert_includes formula, 'version "0.1.0"'
      assert_includes formula, "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/ai-trading-office-v0.1.0/ai-trading-office-v0.1.0-darwin-arm64.tar.gz"
      assert_includes formula, "https://github.com/TradingSandbox/homebrew-tradecli/releases/download/ai-trading-office-v0.1.0/ai-trading-office-v0.1.0-linux-x64.tar.gz"
      assert_includes formula, %(sha256 "#{"c" * 64}")
      assert_includes formula, %(sha256 "#{"d" * 64}")
      assert_includes formula, 'run [opt_bin/"ai-trading-office", "serve"]'
    end
  end

  def test_checked_in_formula_matches_template
    checked_in_formula = File.read(File.join(ROOT, "Formula/tradecli.rb"))
    version = checked_in_formula[/^\s*version "([^"]+)"/, 1]
    shas = checked_in_formula.scan(/^\s*sha256 "([0-9a-f]{64})"/).flatten

    refute_nil version, "expected checked-in formula to declare a version"
    assert_equal 2, shas.length, "expected checked-in formula to declare macOS and Linux SHA256 values"

    Dir.mktmpdir("tradecli-formula-") do |dir|
      output = File.join(dir, "tradecli.rb")

      stdout, stderr, status = Open3.capture3(
        "ruby",
        File.join(ROOT, "scripts/render-formula.rb"),
        "--tag", "v#{version}",
        "--darwin-arm64-sha", shas.fetch(0),
        "--linux-x64-sha", shas.fetch(1),
        "--output", output,
        chdir: ROOT,
      )

      assert status.success?, "expected render script to succeed\nSTDOUT: #{stdout}\nSTDERR: #{stderr}"
      assert_equal checked_in_formula, File.read(output)
    end
  end

  def test_legacy_herdr_formula_migrates_to_homebrew_core
    migrations = JSON.parse(File.read(File.join(ROOT, "tap_migrations.json")))

    assert_equal "homebrew/core", migrations.fetch("herdr")
  end
end
