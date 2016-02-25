require 'spec_helper'

RSpec.describe Dwelling do

  let(:yurt) { Dwelling.new("001 Compass Ave.", "North Pole", "AN", "99999")}

  describe ".new" do
    it "should have a street address" do
      expect(yurt.address).to eq("001 Compass Ave.")
    end
    it "should reside in a city or town" do
      expect(yurt.city).to eq("North Pole")
    end
  end
end
