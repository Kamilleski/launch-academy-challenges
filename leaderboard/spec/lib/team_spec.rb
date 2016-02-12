require 'spec_helper'

RSpec.describe Team do
  let(:team) { team = Team.new("Patriots") }


  describe ".new" do
    it 'has a name' do
      expect(team.name).to eq("Patriots")
    end
    it 'has a rank' do
      expect(team.rank).to eq(nil)
    end
    it 'has a wins count' do
      expect(team.wins).to eq(0)
    end
    it 'has a loss count' do
      expect(team.losses).to eq(0)
    end
  end

  describe ".won_game" do
    it 'should increment wins count by one' do
      team.won_game
      expect(team.wins).to eq(1)
    end
    it 'should increment wins count by one every time' do
      team.won_game
      team.won_game
      expect(team.wins).to eq(2)
    end
  end

  describe ".lost_game" do
    it 'should increment losses count by one' do
      team.lost_game
      expect(team.losses).to eq(1)
    end
    it 'should increment losses count by one every time' do
      team.lost_game
      team.lost_game
      expect(team.losses).to eq(2)
    end
  end

end
