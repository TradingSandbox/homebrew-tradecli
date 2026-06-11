# frozen_string_literal: true

abort "Usage: ruby scripts/add-office-dependency.rb PATH [PATH ...]" if ARGV.empty?

ARGV.each do |path|
  text = File.read(path)
  next if text.include?(%{depends_on "ai-trading-office"})

  updated = text.sub(
    /  depends_on "herdr"\n/,
    "  depends_on \"ai-trading-office\"\n  depends_on \"herdr\"\n",
  )
  abort %(Could not find depends_on "herdr" in #{path}) if updated == text

  File.write(path, updated)
end
