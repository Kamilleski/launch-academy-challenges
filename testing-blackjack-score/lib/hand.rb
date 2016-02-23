require_relative 'deck'

class Hand
  attr_accessor :card_array


  def initialize(cards)
    @cards = cards
  end


  def calculate_hand
    ace_array = []
    @cards.each do |card|
      card.gsub!(/["♦♣♠♥"]/, "")
      card.gsub!(/["JQK"]/, "10")
      if card.include?("A")
        ace_array << card
      end
    end

    @cards.map! { |value| value.to_i }
    subtotal = @cards.reduce(:+)
    if ace_array.length != 0
      if subtotal <= 10
        total = subtotal + 11
        # ace_array.each do |ace|
        #   ace.gsub!(/["A"]/, 11)
        # end
        # total = (@cards + ace_array).reduce(:+)
      else
        total = subtotal + 1
        # ace_array.each do |ace|
        #   ace.gsub!(/["A"]/, 11)
        #
        # total = (@cards + ace_array).reduce(:+)
      end
      # total = (@cards + ace_array).reduce(:+)
    else
      total = subtotal
    end
    return total
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
# hand.calculate_hand # Get this working properly
