require_relative "dwelling"

class Apartment < Dwelling
  attr_reader :price_per_month

  def initialize(address, city, state, zip_code, price_per_month)
    @address = address
    @city = city
    @state = state
    @zip_code = zip_code
    @price_per_month = price_per_month
  end

end
