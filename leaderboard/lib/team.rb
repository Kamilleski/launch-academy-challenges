class Team
  attr_reader :name
  attr_accessor :wins, :losses, :rank

  def initialize(name, rank = nil, wins = 0, losses = 0)
    @name = name
    @rank = rank
    @wins = wins
    @losses = losses
  end

  def won_game
    @wins += 1
  end

  def lost_game
    @losses += 1
  end
end
