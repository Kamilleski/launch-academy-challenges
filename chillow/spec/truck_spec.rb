require 'spec_helper'

RSpec.describe Truck do

  let(:windowless_van) { Truck.new }

  describe ".new" do
    it "should have a max occupancy" do
      expect(windowless_van.max_occupancy).to eq(20)
    end
    it "should have an empty inventory" do
      expect(windowless_van.inventory).to eq([])
    end
  end

  describe "#full?" do
    it "should return true when at max occupancy" do
      20.times do
        windowless_van.add_box("Kamille", "Delgardo")
      end
      expect(windowless_van.full?).to eq(true)
    end
    it "should return false when there is space left" do
      expect(windowless_van.full?).to eq(false)
    end
  end

  describe "#add_box" do
    it "should add a Box to the Truck" do
      windowless_van.add_box("Jimmy", "Do")
      expect(windowless_van.inventory.length).to eq(1)
    end
  end

  describe "#remove_box" do
    it "should remove the first Box of the Truck" do
      windowless_van.add_box("Kamille", "Delgardo")
      windowless_van.add_box("Will", "Mahoney")
      windowless_van.add_box("Nick", "Alberts")
      windowless_van.remove_box
      expect(windowless_van.inventory.length).to eq(2)
    end
  end
end
