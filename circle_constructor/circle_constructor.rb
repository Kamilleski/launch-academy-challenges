class Circle
  attr_reader :radius, :diameter, :input

  def initialize(input)
    if input.kind_of?(Hash)
      if input[:diameter]
        @radius = input[:diameter] / 2
      else
        @radius = input[:radius]
      end
    else
      @radius = input
    end
  end
end
