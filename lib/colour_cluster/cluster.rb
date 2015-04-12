class Cluster

  attr_reader :pixels

  def initialize
    @pixels   = []
    @centroid = nil
  end

  def add(*new_pixels)
    (@pixels << new_pixels).flatten!
  end

  def empty
    @pixels = []
  end

  def centroid
    centroid ||= calculate_centroid
  end

  private

  def calculate_centroid
    return nil if pixels.empty?
    @pixels.inject(Pixel.new(0,0,0), :+) / @pixels.length
  end

end