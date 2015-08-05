class Pattern
  attr_reader :pattern, :pattern_sting, :wildcards,
    :matched_with_wilcard, :weight

  def initialize(pattern_str)
    @pattern_sting = pattern_str
    @pattern       = pattern_str.split(",").map(&:strip)
    @wildcards     = pattern.map.with_index {|p, i| i if p == "*" }.compact
    @matched_with_wilcard = false
    @weight               = evaluate
  end

  def matches?(path)
    if matches_without_wildcard?(path)
      return true
    elsif matches_with_wildcard?(path)
      @matched_with_wilcard = true
      return true
    end
    return false
  end

  def length
    pattern.length
  end

  private

  def evaluate
    if pattern_sting.start_with?('*')
      100 - (wildcards.size * 20)
    elsif pattern_sting.end_with?('*')
      100 - (wildcards.size * 10) + 10
    else
      100 - (wildcards.size * 10)
    end
  end

  def matches_without_wildcard?(path)
    matches = pattern.select.with_index do |key, idx|
      [ path.path[idx]].include?(key)
    end
    matches.size == pattern.length
  end

  def matches_with_wildcard?(path)
    matches = pattern.select.with_index do |key, idx|
      [ "*", path.path[idx]].include?(key)
    end
    matches.size == pattern.length
  end
end
