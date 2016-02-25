require 'spec_helper'

RSpec.describe Apartment do

  let(:co_ops) { Apartment.new("2424 Ridge Rd.", "Berkeley", "CA", "94709", "$637", Date.new(2013,2,3), Date.new(2014,1,1))}

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
    it "should have a lease end date" do
      expect(co_ops.lease_end).to eq(Date.new(2014,1,1))
    end
    it "should have an ending date after the start date" do
      expect(co_ops.lease_start).to be < (co_ops.lease_end)
    end
  end

  describe "#full?" do
    it "should return true when at max occupancy" do
      co_ops.add_roommate("Kamille", "Delgardo")
      co_ops.add_roommate("Will", "Mahoney")
      co_ops.add_roommate("Nick", "Alberts")
      expect(co_ops.full?).to eq(true)
    end
    it "should return false when there is space left" do
      expect(co_ops.full?).to eq(false)
    end
  end

  describe "#add_roommate" do
    it "should add an Occupant to the Apartment" do
      co_ops.add_roommate("Jimmy", "Do")
      expect(co_ops.roommates.length).to eq(1)
    end
  end

  describe "#remove_roommate" do
    it "should remove the first Occupant of the Apartment" do
      co_ops.add_roommate("Kamille", "Delgardo")
      co_ops.add_roommate("Will", "Mahoney")
      co_ops.add_roommate("Nick", "Alberts")
      co_ops.remove_roommate
      expect(co_ops.roommates.length).to eq(2)
    end
  end
end
