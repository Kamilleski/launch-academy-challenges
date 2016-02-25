require 'spec_helper'

RSpec.describe Box do

  let(:kamille) { Occupant.new("Kamille", "Delgardo")}
  let(:tupperware) { Box.new(kamille) }

  describe ".new" do
    it "should have an owner" do
      expect(tupperware.owner).to eq(kamille)
    end
    it "should have an owner who is of Occupant class" do
      expect(kamille.class).to eq(Occupant)
    end
  end
end
