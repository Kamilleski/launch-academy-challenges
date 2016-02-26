module Item_Methods

  attr_reader :max_capacity
  attr_accessor :current_contents

  def initialize(max_capacity = 20)
    @max_capacity = max_capacity
    @current_contents = []
  end

  def add_item
    @current_contents << Box.new
  end

  def full?
    @current_contents.length == max_capacity
  end

  def add_item(first_name, last_name)
    if !full?
      @current_contents << Box.new(owner = Occupant.new(first_name, last_name))
    end
  end

  def remove_item
    @current_contents.pop
    @current_contents
  end
end
