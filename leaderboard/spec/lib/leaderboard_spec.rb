require 'spec_helper'
require '/Users/Andromeda/Google-Drive/Kamilleski/launch-academy-challenges/leaderboard/lib/leaderboard.rb'

RSpec.describe Leaderboard do
  let(:leaderboard) { Leaderboard.new }

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
    it "should return the array of inputted game data as its game_data attribute" do
      expect(leaderboard.team_object_array.class).to eq(Array)
    end
  end

## Once we know the object is a Team, the team_spec tests will apply to it
  describe ".array_creator" do
    it "should return an array of team objects" do
      expect(leaderboard.team_object_array[0].class).to eq(Team)
    end
  end

  describe ".sorter" do
    it "should return a sorted array based on most wins and fewest losses" do
      result = leaderboard.sorter
      expect(result.first.name).to eq("Patriots")
      expect(result.last.name).to eq("Colts")
    end
    it "should store the most wins first and fewest wins last" do
      result = leaderboard.sorter
      expect(result.first.wins).to be > result.last.wins
    end
    it "should store fewest losses first and most losses last" do
      result = leaderboard.sorter
      expect(result.first.losses).to be < result.last.losses
    end
  end

end
