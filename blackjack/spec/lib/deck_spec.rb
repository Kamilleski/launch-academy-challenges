require "spec_helper"

RSpec.describe Deck do
  let(:deck) { Deck.new }

  describe "#build_deck" do
    it "should create a deck of 52 objects" do
      expect(deck.cards.size).to eq(52)
    end
    it "creates unique cards" do
      expect(deck.cards.uniq.size).to eq 52
    end
  end

  describe "deal" do
    it "should remove number of cards passed as argument" do
      deck.deal(2)
      expect(deck.cards.length).to eq(50)
    end

    it "should return an error when deck is empty" do
      deck.deal(53)
      expect{ deck.deal(53) }.to output("Deck out of cards! Game over.\n").to_stdout
    end
  end

end
