require 'sinatra'
require 'csv'

get "/favorites" do
  @favorites = CSV.readlines("favorites_list.csv", headers: true)
  erb :favorites
end

get "/" do
  redirect "/favorites"
end

post "/favorites" do
  fav = params[:favorite_thing]
  unless fav.strip.empty?
    CSV.open("favorites_list.csv", "a") do |file|
      row << [fav]
    end
  end
  redirect "/favorites"
end
