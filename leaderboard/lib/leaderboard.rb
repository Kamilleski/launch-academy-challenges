require "spec_helper"
require_relative "team"

class Leaderboard
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
# attr_reader :game_data, :team_object_array
#
#   def initialize(game_data, team_object_array = [])
#     @game_data = game_data
#     @team_object_array = team_object_array
#   end
#
#   def array_creator
#     GAME_INFO.each do |game|
#       ## figuring out who won
#       if game[:home_score] > game[:away_score]
#         winning_team = game[:home_team]
#         losing_team = game[:away_team]
#       else
#         winning_team = game[:away_team]
#         losing_team = game[:home_team]
#       end
#
#       if team_object_array.include?(winning_team)
#         ## increment team's attribute 'wins' count by one
#       else
#         team_object_array << Team.new(winning_team).won_game
#       end
#
#       if team_object_array.include?(losing_team)
#         ## increment team's losses by one
#       else
#         team_object_array << Team.new(winning_team).won_game
#       end
#
#     end
#   end
#
#     # def sorter
#     #   ##compare wins and losses of Team objects and use a sorting function
#     # end
#
# binding.pry
end
