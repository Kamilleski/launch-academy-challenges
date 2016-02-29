require_relative "../lib/team_data"

class Team
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.all
    TeamData.to_h.keys.map do |name|
      Team.new(name)
    end
  end

end
