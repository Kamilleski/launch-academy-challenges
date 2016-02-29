require "sinatra"
require_relative "models/player"
require_relative "models/team"
require 'pry'

get "/" do
  "<h1>The LACKP Homepage<h1>" +
  "<p>The League of Cool Kickball Professionals is the premier kickball league in New England. If you're not cool, get out.</p>"
end

get "/teams" do
  @team_name_array = TeamData.to_h.keys
  erb :index
end

get "/teams/:team_name" do |key|
  @team = TeamData.to_h.select { |key| key == params[:team_name]}.first
  erb :individual_teams
end
