require "spec_helper"

RSpec.describe Game do

  let(:game) { Game.new }
  let(:ace_hearts) { Card.new("A", "♥") }
  let(:two_hearts) { Card.new(2, "♥") }
  let(:king_hearts) { Card.new("K", "♥") }
  let(:six_hearts) { Card.new(6, "♥") }
  let(:king_spades) {Card.new("K", "♠" )}

  describe ".new" do
    it "should initialize player and dealer scores of zero" do
      expect(Game.new.player_score).to eq(0)
      expect(Game.new.dealer_score).to eq(0)
    end
    it "should initialize empty arrays for dealer and player hands" do
      expect(Game.new.dealer.cards).to eq([])
      expect(Game.new.player.cards).to eq([])
    end
    it "should create a Deck class" do
      expect(Game.new.cards).to be_a(Deck)
    end
  end

  describe "#begin_game" do
    it "should add two Cards to player's Hand" do

    end
    it "should welcome player to game" do

    end
  end

  describe "#player_deal_one" do
    it "should add one Card to player's Hand" do
      game.player_deal_one
      expect(game.player.cards.size).to eq(1)
    end
    it "should run as many times as I want" do
      3.times do
        game.player_deal_one
      end
      expect(game.player.cards.size).to eq(3)
    end
  end

  describe "#dealer_deal_one" do
    it "should add one Card to dealer's Hand" do
      game.dealer_deal_one
      expect(game.dealer.cards.size).to eq(1)
    end
    it "should run as many times as I want" do
      6.times do
        game.dealer_deal_one
      end
      expect(game.dealer.cards.size).to eq(6)
    end
  end

  describe "#ace_check?" do
    it "should return true when player Hand includes an Ace" do
      game.player.cards << ace_hearts
      expect(game.ace_check?).to eq(true)
    end
    it "should return false when player Hand does not include an Ace" do
      game.player.cards << two_hearts
    end
  end

  describe "#check_dealer_score" do
    it "should add Card to dealer Hand if score is < 17" do
      game.dealer.cards << six_hearts
      game.dealer.cards << king_hearts
      game.check_dealer_score
      expect(game.dealer.cards.size).to be > 2
    end
  end

  describe "#check_player_score" do

  end

  describe "#check_final_score" do
    it "should state that player won" do
      game.player_score = 20
      game.dealer_score = 10
      expect{ game.check_final_score }.to output("Player wins!\n").to_stdout
    end
    it "should state that dealer won" do
      game.player_score = 10
      game.dealer_score = 20
      expect{ game.check_final_score }.to output("Dealer wins!\n").to_stdout
    end
    it "should state that the game was a tie" do
      game.player_score = 17
      game.dealer_score = 17
      expect{ game.check_final_score }.to output("Tie!\n").to_stdout
    end
  end

end
