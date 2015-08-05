require_relative 'path'
require_relative 'pattern'

class PatternMatcher
  attr_reader :patterns, :paths

  def initialize(in_file)
    @patterns = []
    @paths = []

    read_patterns_and_path(in_file)
  end

  def match
    results = paths.map { |path| best_pattern_match(path) }
  end

  private
  def read_patterns_and_path(in_file)
    File.open(in_file, "r").each do |line|
      paths << Path.new(line.chomp) unless (line.chomp =~ /\//).nil?
      patterns << Pattern.new(line.chomp) unless (line.chomp =~ /,/).nil?
    end
  end

  def get_matching_pattern(path)
    patterns.select { |p| p.length == path.length }
  end

  def best_pattern_match(path)
    matching_patterns = get_matching_pattern(path)
    matches = matching_patterns.select { |p| p.matches?(path) }

    if matches.size == 1
      matches.first.pattern_sting
    elsif matches.size > 1
      matches = matches.sort_by { |p| p.weight }.reverse

      if matches.first.wildcards.size == 1
        matches.first.pattern_sting
      else
        matches.first.pattern_sting
      end
    else
      "NO MATCH"
    end
  end
end
