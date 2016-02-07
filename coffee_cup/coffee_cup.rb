class CoffeeCup
  attr_accessor :liquid
  attr_reader :capacity

  def initialize(capacity = 12, liquid = 8)
    @capacity = capacity
    @liquid = liquid
  end

  def sip!
    if liquid > 0
      @liquid -= 1
    else
      puts "Hey! You need a refill!"
    end
  end

  def spill!
    @liquid = 0
  end

  def refill!
    @liquid = capacity - 2
  end
end
