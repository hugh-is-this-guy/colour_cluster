class Pixel

  attr_reader :red, :green, :blue

  def initialize(red, green, blue)
    @red    = red
    @green  = green
    @blue   = blue
  end

  def distance_to(other_pixel)
    sum = ((@red    - other_pixel.red)   ** 2) +
          ((@green  - other_pixel.green) ** 2) +
          ((@blue   - other_pixel.blue)  ** 2)

    sum ** 0.5
  end

  def +(other_pixel)
    Pixel.new(@red + other_pixel.red, @green + other_pixel.green, 
              @blue + other_pixel.blue)
  end

  def /(n)
    Pixel.new(@red / n, @green  / n, @blue / n)
  end

end


