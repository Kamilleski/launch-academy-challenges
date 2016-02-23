require_relative "deck"
require_relative "hand"
require "pry"


class Game
  def initialize
    @cards = Deck.new
    @player = Hand.new
    @computer = Hand.new
  end

  deck = Deck.new
  cards = deck.deal(2)
  hand = Hand.new(cards)
end

binding.pry
