require 'spec_helper'
require '/Users/Andromeda/Google-Drive/Kamilleski/launch-academy-challenges/leaderboard/lib/leaderboard.rb'

RSpec.describe Leaderboard do
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

  describe ".new" do
    it "should return an empty team object array as its team_object_array attribute" do
      result = Leaderboard.new(GAME_INFO)
      expect(result.team_object_array).to eq([])
    end
    it "should return the array of inputted game data as its game_data attribute" do
      result = Leaderboard.new(GAME_INFO)
      expect(result.team_object_array.class).to eq(Array)
    end
  end
end
