require_relative "box"

class Truck
  include Item_Methods

  def add_item(first_name, last_name)
    if !full?
      @current_contents << Box.new(owner = Occupant.new(first_name, last_name))
    end
  end
end
