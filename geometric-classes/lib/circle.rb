class Circle
  attr_accessor :radius, :x, :y, :diameter, :area, :perimeter

  def initialize(radius, x = 0, y = 0)
    @radius = radius.to_f
    @x = x.to_f
    @y = y.to_f
    @diameter = radius * 2
    @area = ((radius * radius) * 3.14159).round(2)
    @perimeter = (2 * 3.14159 * radius).round(2)
  end
end
