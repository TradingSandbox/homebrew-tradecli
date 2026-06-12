# frozen_string_literal: true

require "erb"
require "fileutils"
require "optparse"

ROOT = File.expand_path("..", __dir__)
DEFAULT_TEMPLATE_RELATIVE_PATH = "templates/ai-trading-office.rb.erb"
DEFAULT_OUTPUT_RELATIVE_PATH = "Formula/ai-trading-office.rb"

class OfficeFormulaTemplateContext
  attr_reader :tag, :formula_version, :darwin_arm64_sha, :linux_x64_sha, :darwin_arm64_bottle_sha, :linux_x64_bottle_sha

  def initialize(tag:, version:, darwin_arm64_sha:, linux_x64_sha:, darwin_arm64_bottle_sha: nil, linux_x64_bottle_sha: nil)
    @tag = tag
    @formula_version = version
    @darwin_arm64_sha = darwin_arm64_sha.downcase
    @linux_x64_sha = linux_x64_sha.downcase
    @darwin_arm64_bottle_sha = darwin_arm64_bottle_sha&.downcase
    @linux_x64_bottle_sha = linux_x64_bottle_sha&.downcase
  end

  def get_binding
    binding
  end
end

def parse_options(argv)
  options = {
    template: File.join(ROOT, DEFAULT_TEMPLATE_RELATIVE_PATH),
    output: File.join(ROOT, DEFAULT_OUTPUT_RELATIVE_PATH),
  }

  OptionParser.new do |parser|
    parser.banner = "Usage: ruby scripts/render-office-formula.rb --tag ai-trading-office-vX.Y.Z --version X.Y.Z --darwin-arm64-sha SHA --linux-x64-sha SHA [--output PATH]"
    parser.on("--tag TAG", "Public tap release tag") { |value| options[:tag] = value }
    parser.on("--version VERSION", "Formula version without leading v") { |value| options[:version] = value }
    parser.on("--darwin-arm64-sha SHA", "SHA256 for the macOS arm64 archive") { |value| options[:darwin_arm64_sha] = value }
    parser.on("--linux-x64-sha SHA", "SHA256 for the Linux x64 archive") { |value| options[:linux_x64_sha] = value }
    parser.on("--darwin-arm64-bottle-sha SHA", "SHA256 for the macOS arm64 bottle (optional)") { |value| options[:darwin_arm64_bottle_sha] = value }
    parser.on("--linux-x64-bottle-sha SHA", "SHA256 for the Linux x64 bottle (optional)") { |value| options[:linux_x64_bottle_sha] = value }
    parser.on("--template PATH", "Template path") { |value| options[:template] = File.expand_path(value, ROOT) }
    parser.on("--output PATH", "Output formula path") { |value| options[:output] = File.expand_path(value, ROOT) }
  end.parse!(argv)

  options
end

def validate_options!(options)
  missing = [:tag, :version, :darwin_arm64_sha, :linux_x64_sha].select { |key| options[key].to_s.empty? }
  abort "Missing required options: #{missing.map { |key| "--#{key.to_s.tr("_", "-")}" }.join(", ")}" unless missing.empty?
  abort "--tag must look like ai-trading-office-vX.Y.Z" unless options[:tag].match?(/\Aai-trading-office-v\d+\.\d+\.\d+(?:[-+][0-9A-Za-z.-]+)?\z/)
  abort "--version must look like X.Y.Z" unless options[:version].match?(/\A\d+\.\d+\.\d+(?:[-+][0-9A-Za-z.-]+)?\z/)

  [:darwin_arm64_sha, :linux_x64_sha].each do |key|
    next if options[key].match?(/\A[0-9a-fA-F]{64}\z/)

    abort "--#{key.to_s.tr("_", "-")} must be a 64-character SHA256"
  end

  [:darwin_arm64_bottle_sha, :linux_x64_bottle_sha].each do |key|
    next if options[key].to_s.empty? || options[key].match?(/\A[0-9a-fA-F]{64}\z/)

    abort "--#{key.to_s.tr("_", "-")} must be a 64-character SHA256"
  end
end

options = parse_options(ARGV)
validate_options!(options)

context = OfficeFormulaTemplateContext.new(
  tag: options[:tag],
  version: options[:version],
  darwin_arm64_sha: options[:darwin_arm64_sha],
  linux_x64_sha: options[:linux_x64_sha],
  darwin_arm64_bottle_sha: options[:darwin_arm64_bottle_sha],
  linux_x64_bottle_sha: options[:linux_x64_bottle_sha],
)

template = ERB.new(File.read(options[:template]), trim_mode: "-")
formula = template.result(context.get_binding)

FileUtils.mkdir_p(File.dirname(options[:output]))
File.write(options[:output], formula)
puts "Rendered #{options[:output]}"
