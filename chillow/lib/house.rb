require_relative "dwelling"

class House < Dwelling
  attr_reader :asking_price

  def initialize(address, city, state, zip_code, asking_price)
    @address = address
    @city = city
    @state = state
    @zip_code = zip_code
    @asking_price = asking_price
  end
end
