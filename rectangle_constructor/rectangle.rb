class Rectangle
  attr_reader :height, :width

  def initialize(height, width = nil)
    @height = height
    if width.nil?
      @width = height
    else
      @width = width
    end
  end

  def area
    @area = height * width
  end
end

kamille = Rectangle.new(3)
puts kamille.area
