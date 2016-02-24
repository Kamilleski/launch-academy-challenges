require_relative "deck"
require_relative "hand"
require_relative "card"

class Game

  attr_accessor :cards, :player, :dealer, :player_score, :dealer_score

  def initialize
    @cards = Deck.new
    @player = Hand.new
    @dealer = Hand.new
    @player_score = 0
    @dealer_score = 0
  end

  def begin_game
    puts "Welcome to Blackjack!\n\n"
    2.times do
      player_deal_one
    end
    puts "Player score: #{@player_score}"
    continue?
  end

  def player_deal_one
    @player.cards += @cards.deal(1)
    @player_score += (@player.cards.last.value)
    puts "Player was dealt #{@player.cards.last.rank}#{@player.cards.last.suit}."
  end

  def dealer_deal_one
    @dealer.cards += @cards.deal(1)
    @dealer_score += (@dealer.cards.last.value)
    puts "Dealer was dealt #{@dealer.cards.last.rank}#{@dealer.cards.last.suit}."
  end

  def continue?
    puts "Hit or Stand (h/s): "
    next_move = gets.chomp.downcase
    if next_move == "s"
      puts "Player stands. \nPlayer score: #{@player_score}"
      dealer_turn
    elsif next_move == "h"
      player_deal_one
      check_player_score
    else
      error_message
    end
  end

  def error_message
    print "Error -- "
    continue?
  end

  def player_score_output
    puts "Player score: #{@player_score}"
  end

  def dealer_turn
    2.times do
      dealer_deal_one
    end
    check_dealer_score
  end

  def ace_check?
    @player.cards.each do |card|
      return true if card.rank == "A"
    end
    false
  end

  def check_dealer_score
    while @dealer_score < 17
      dealer_deal_one
    end
    puts "Dealer Score: #{@dealer_score}"
    check_final_score
  end

  def check_player_score
    if @player_score < 21
      player_score_output
      continue?
    elsif @player_score > 21
      if ace_check?
        @player_score -= 10
        player_score_output
        continue?
      else
        player_score_output
        puts "Bust! Player loses."
      end
    else
      dealer_turn
    end
  end

  def check_final_score
    if (@player_score > @dealer_score) || (@dealer_score > 21)
      puts "Player wins!"
    elsif @dealer_score > @player_score
      puts "Dealer wins!"
    elsif @dealer_score == @player_score
      puts "Tie!"
    end
  end

end
