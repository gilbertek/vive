#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path('./../lib', __FILE__)

require 'pattern_matcher'

in_file = ARGV[0]
out_file = ARGV[1]

result = PatternMatcher.new(in_file).match

File.open(out_file, "w") { |file| file.write(result.join("\n")) } unless out_file.nil?

puts result.inspect
