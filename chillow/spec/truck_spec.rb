require 'spec_helper'

RSpec.describe Truck do

  let(:windowless_van) { Truck.new }

  describe ".new" do
    it "should have a max occupancy" do
      expect(windowless_van.max_capacity).to eq(20)
    end
    it "should have an empty current_contents" do
      expect(windowless_van.current_contents).to eq([])
    end
  end

  describe "#full?" do
    it "should return true when at max occupancy" do
      20.times do
        windowless_van.add_item("Kamille", "Delgardo")
      end
      expect(windowless_van.full?).to eq(true)
    end
    it "should return false when there is space left" do
      expect(windowless_van.full?).to eq(false)
    end
  end

  describe "#add_item" do
    it "should add a Box to the Truck" do
      windowless_van.add_item("Jimmy", "Do")
      expect(windowless_van.current_contents.length).to eq(1)
    end
  end

  describe "#remove_item" do
    it "should remove the first Box of the Truck" do
      windowless_van.add_item("Kamille", "Delgardo")
      windowless_van.add_item("Will", "Mahoney")
      windowless_van.add_item("Nick", "Alberts")
      windowless_van.remove_item
      expect(windowless_van.current_contents.length).to eq(2)
    end
  end
end
