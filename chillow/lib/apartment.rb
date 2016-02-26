require_relative "dwelling"
require_relative "occupant"
require 'Date'
require_relative "item_methods"

class Apartment < Dwelling
  include Item_Methods

  attr_reader :price_per_month, :lease_start, :lease_end

  def initialize(address, city, state, zip_code, price_per_month, lease_start, lease_end, max_capacity = 3)
    @address = address
    @city = city
    @state = state
    @zip_code = zip_code
    @price_per_month = price_per_month
    @lease_start = lease_start
    @lease_end = lease_end
    @max_capacity = max_capacity
    @current_contents = []
  end

  def add_item(first_name, last_name)
    if !full?
      @current_contents << Occupant.new(first_name, last_name)
    end
  end
end
