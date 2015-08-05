class Path
  attr_reader :path, :full_path

  def initialize(path_str)
    @full_path = path_str
    @path = path_str.gsub(/\A\/|\/\Z/, "").split("/")
  end

  def length
    path.length
  end

  def to_s
    path
  end
end
