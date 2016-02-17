require_relative "../spec/spec_helper"
require_relative "team"

class Leaderboard

attr_reader :game_data, :team_object_array

GAME_INFO = [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 17,
      away_score: 13
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 24,
      away_score: 7
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 21,
      away_score: 17
    },
    {
      home_team: "Broncos",
      away_team: "Steelers",
      home_score: 11,
      away_score: 27
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 24,
      away_score: 31
    }
]

  def initialize(game_data = GAME_INFO, team_object_array = [])
    @game_data = game_data
    @team_object_array = team_object_array
    array_creator
  end

  def array_creator
    GAME_INFO.each do |game|
      ## figuring out who won
      if game[:home_score] > game[:away_score]
        winning_team = game[:home_team]
        losing_team = game[:away_team]
      else
        winning_team = game[:away_team]
        losing_team = game[:home_team]
      end

      ## incrementing each team's wins and losses and putting them in an array
      if team_object_array.any?{ |team| team.name == winning_team }
        team_index = team_object_array.find_index{|team| team.name == winning_team}
        team_object_array[team_index].won_game
      else
        winners = Team.new(winning_team)
        winners.won_game
        team_object_array << winners
      end

      if team_object_array.any?{ |team| team.name == losing_team }
        team_index = team_object_array.find_index{|team| team.name == losing_team}
        team_object_array[team_index].lost_game
      else
        losers = Team.new(losing_team)
        losers.lost_game
        team_object_array << losers
      end
    end
    team_object_array
  end

  def sorter
    ##compare wins and losses of Team objects and use a sorting function
    number_of_teams = team_object_array.length
    team_object_array.sort!{ |team_1, team_2| (team_1.wins == team_2.wins) ? team_1.wins <=> team_2.wins : team_2.losses <=> team_1.losses }
    team_object_array.reverse!
    team_object_array.each_with_index do |team, index|
      team.rank = index + 1
    end
  end

  def display
    sorter
    puts "--------------------------------------------------"
    puts "| Name      Rank      Total Wins    Total Losses |"
    team_object_array.each_with_index do |team, index|
      printf("|%9s %4s %12s %14s      |\n", "#{team.name}", "#{team.rank}", "#{team.wins}", "#{team.losses}")
    end
    puts "--------------------------------------------------"
  end
end
