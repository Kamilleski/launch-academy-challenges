## Part 1
def perimeter_calculator(width, height)
  return (2 * width) + (2 * height)
end

## Part 2
def quadrangle_perimeter(width, height = nil)
  if height.nil?
    return width * 4
  else
    return (2 * width) + (2 * height)
  end
end
