require "spec_helper"

describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'

  let(:hand) { Hand.new(["10♦", "J♥"]) }

  describe "#calculate_hand" do
    it "should return 20" do
      expect(hand.calculate_hand).to eq(20)
    end

    it "should return 21" do
      chicken_dinner = Hand.new(["A♠", "10♠"])
      expect(chicken_dinner.calculate_hand).to eq(21)
    end

    it "should return 30" do
      chicken_dinner = Hand.new(['10♣', '10♠', '10♥'])
      expect(chicken_dinner.calculate_hand).to eq(30)
    end

    it "fails" do
      expect(false).to eq false
    end
    # add the remaining tests here
  end
end
