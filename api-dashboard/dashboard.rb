require "./lib/geolocation"
require "sinatra/base"
require "json"
require "net/http"

require "dotenv"
Dotenv.load


class Dashboard < Sinatra::Base
  get("/") do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
    key = ENV["FORECAST_IO_KEY"]

    # def get_weather
    #   url= 'https://api.forecast.io/forecast/79c5ddeb7704ce6e8973f4e0a48536a3/37.3646056,-122.4673584'
    #   uri = URI(url)
    #   response = Net::HTTP.get_response(uri)
    #   parsed_data = JSON.parse(response)
    #   puts parsed_data
    # end

    erb :dashboard
  end
end
