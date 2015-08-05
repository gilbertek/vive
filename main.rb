#!/usr/bin/env ruby

require_relative 'path'
require_relative 'pattern'

in_file = ARGV[0]
out_file = ARGV[1]

def get_matching_pattern(found_patterns, path)
  found_patterns.select { |p| p.length == path.length }
end

def best_pattern_match(found_patterns, path)
  matching_patterns = get_matching_pattern(found_patterns, path)
  matches = matching_patterns.select { |p| p.matches?(path) }

  if matches.size == 1
    puts matches.first.pattern_sting
  elsif matches.size > 1
    matches = matches.sort_by { |p| p.weight }.reverse

    if matches.first.wildcards.size == 1
      puts matches.first.pattern_sting
    else
      puts matches.first.pattern_sting
    end
  else
    puts "NO MATCH"
  end
end

def read_patterns_and_path(in_file)
  patterns = []
  paths   = []

  File.open(in_file, "r").each do |line|
    paths << Path.new(line.chomp) unless (line.chomp =~ /\//).nil?
    patterns << Pattern.new(line.chomp) unless (line.chomp =~ /,/).nil?
  end

  return {patterns: patterns, paths: paths}
end

input_data     = read_patterns_and_path(in_file)
found_patterns = input_data[:patterns]
found_paths    = input_data[:paths]

found_paths.each do |path|
  best_pattern_match(found_patterns, path)
end


