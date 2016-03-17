require "sinatra"
require "sinatra/activerecord"
require "sinatra/flash"

set :views, File.join(File.dirname(__FILE__), "app/views")
require_relative "app/models/television_show"

get "/" do
  redirect "/television_shows"
end

get "/television_shows" do
  @shows = TelevisionShow.all
  erb :index
end

get "/television_shows/new" do
  @show = TelevisionShow.new
  erb :new
end

get "/television_shows/:id" do
  @show = TelevisionShow.find(params[:id])
  if @show.ending_year.nil?
    @show_end = "present"
  else
    @show_end = @show.ending_year
  end
  erb :show
end

post "/television_shows" do
  @show = TelevisionShow.new(params[:television_show])

  if @show.save
    redirect "/television_shows"
  else
    @missing_fields = true
    @error_message = "Data not saved -- missing required form fields!"
    erb :new
  end
end
