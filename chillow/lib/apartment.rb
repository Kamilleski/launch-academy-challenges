require_relative "dwelling"
require_relative "occupant"
require 'Date'

class Apartment < Dwelling
  attr_reader :price_per_month, :lease_start, :lease_end, :max_occupancy

  attr_accessor :roommates

  def initialize(address, city, state, zip_code, price_per_month, lease_start, lease_end, max_occupancy = 3)
    @address = address
    @city = city
    @state = state
    @zip_code = zip_code
    @price_per_month = price_per_month
    @lease_start = lease_start
    @lease_end = lease_end
    @max_occupancy = max_occupancy
    @roommates = []
  end

  def full?
    @roommates.length == max_occupancy
  end

  def add_roommate(first_name, last_name)
    if !full?
      @roommates << Occupant.new(first_name, last_name)
    end
  end

  def remove_roommate
    @roommates.pop
    @roommates
  end
end
