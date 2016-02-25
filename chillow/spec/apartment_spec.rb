require 'spec_helper'

RSpec.describe Apartment do

  let(:co_ops) { Apartment.new("2424 Ridge Rd.", "Berkeley", "CA", "94709", "$637")}

  describe ".new" do
    it "should have a street address" do
      expect(co_ops.address).to eq("2424 Ridge Rd.")
    end
    it "should reside in a city or town" do
      expect(co_ops.city).to eq("Berkeley")
    end
    it "should have a monthly rent" do
      expect(co_ops.price_per_month).to eq("$637")
    end
  end
end
