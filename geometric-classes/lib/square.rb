class Square
  attr_accessor :side, :x, :y, :length, :width, :diameter, :perimeter, :area

  def initialize(side, x = 0, y = 0)
    @side = side
    @x = x
    @y = y
    @length = side
    @width = side
    @diameter = side * 1.41421
    @perimeter = side * 4
    @area = side * side
  end

  def contains_point?(x_point, y_point)
    x_point_min = @x - (length.to_f / 2)
    x_point_max = @x + (length.to_f / 2)
    y_point_min = @y - (length.to_f / 2)
    y_point_max = @y + (length.to_f / 2)
    if x_point >= x_point_min && x_point <= x_point_max
      if y_point >= y_point_min && y_point <= y_point_max
        return true
      else
        return false
      end
    else
      return false
    end
  end
end
