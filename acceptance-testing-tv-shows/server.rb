require 'pry'
require 'sinatra'
require 'csv'
require_relative "app/models/television_show"

set :views, File.join(File.dirname(__FILE__), "app/views")

get '/television_shows' do
  @shows = []
  CSV.foreach('television-shows.csv', headers: true, header_converters: :symbol)  do |row|
    @shows << row.to_hash
  end
  erb :index
end

get "/television_shows/new" do
  erb :new
end

post "/television_shows/new" do

  @title = params['title']
  @network = params['network']
  @starting_year = params['starting_year']
  @synopsis = params['synopsis']
  @genre = params['genre']

  @empty_error = nil
  @duplicate_error=nil

  if @title != '' && @network != '' && @starting_year != '' && @synopsis != '' && @genre != ''

    @shows_titles = []
    CSV.foreach('television-shows.csv', headers: true, header_converters: :symbol)  do |row|
      @shows_titles << row[:title]
    end

    if @shows_titles.include?(@title)
      @duplicate_error = "The show has already added"
    else
      CSV.open('television-shows.csv', 'a') do |csv|
        csv << [@title, @network, @starting_year, @synopsis, @genre]
      end
      redirect '/television_shows'
    end

  else
     @empty_error = "Please fill in all required fields"
  end

  erb :new
end
