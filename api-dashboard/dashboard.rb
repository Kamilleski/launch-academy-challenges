require "./lib/geolocation"
require "sinatra/base"
require "json"
require "net/http"
require 'pry'

require "dotenv"
Dotenv.load

class Dashboard < Sinatra::Base
  key = ENV["FORECAST_IO_KEY"]
  # current_location = Geolocation.new("8.8.8.8")

  get "/" do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
    # key = ENV["FORECAST_IO_KEY"]
    erb :dashboard
  end

  get "/news" do

  end

  get "/weather" do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
    get_weather(key, @geolocation)

    erb :weather
  end

  get "/events" do

  end

  def get_weather(key, geolocation)
    url= "https://api.forecast.io/forecast/#{key}/#{geolocation.data["latitude"]},#{geolocation.data["longitude"]}"
    uri = URI(url)
    response = Net::HTTP.get_response(uri)
    parsed_data = JSON.parse(response.body)
    @current_weather = parsed_data["currently"]["summary"]
    @future_weather = parsed_data["minutely"]["summary"]
    @temperature = parsed_data["currently"]["temperature"]
  end
end
