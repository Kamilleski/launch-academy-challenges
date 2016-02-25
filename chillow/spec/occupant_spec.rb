require 'spec_helper'

RSpec.describe Occupant do

  let(:kamille) { Occupant.new("Kamille", "Delgardo")}

  describe ".new" do
    it "should have a first name" do
      expect(kamille.first_name).to eq("Kamille")
    end
    it "should have a last name" do
      expect(kamille.last_name).to eq("Delgardo")
    end
  end
end
