class Card

  attr_accessor :rank, :suit, :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = value_assigner
  end

  def value_assigner
    if @rank.class == Fixnum
      @value = @rank
    elsif @rank.include?("J") || @rank.include?("Q") || @rank.include?("K")
      @value = 10
    elsif @rank == "A"
      @value = 1
    end
  end
end
