require_relative "occupant"

class Box
  attr_reader :owner

  def initialize(owner = Occupant.new(first_name, last_name))
    @owner = owner
  end
end
