require_relative "box"

class Truck
  attr_reader :max_occupancy
  attr_accessor :inventory

  def initialize(max_occupancy = 20)
    @max_occupancy = max_occupancy
    @inventory = []
  end

  def add_box
    @inventory << Box.new
  end

  def full?
    @inventory.length == max_occupancy
  end

  def add_box(first_name, last_name)
    if !full?
      @inventory << Box.new(owner = Occupant.new(first_name, last_name))
    end
  end

  def remove_box
    @inventory.pop
    @inventory
  end

end
