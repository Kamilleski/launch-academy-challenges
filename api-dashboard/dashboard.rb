require "./lib/geolocation"
require "sinatra/base"
require "json"
require "net/http"
require 'pry'
require 'uri'

require "dotenv"
Dotenv.load

class Dashboard < Sinatra::Base
  weather_key = ENV["FORECAST_IO_KEY"]
  news_key = ENV["NY_TIMES_KEY"]

  get "/" do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)

    erb :dashboard
  end

  get "/news" do
    get_news(news_key)

    erb :news
  end

  get "/weather" do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
    get_weather(weather_key, @geolocation)

    erb :weather
  end

  get "/events" do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
    get_events(@geolocation)

    erb :events
  end

  def get_news(key)
    @news_titles = []
    url = "http://api.nytimes.com/svc/topstories/v1/technology.json?api-key=#{key}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed_crap = JSON.parse(response)
    parsed_crap["results"].each do |result|
      @news_titles << result["title"]
    end
  end

  def get_events(geolocation)
    url = "https://api.seatgeek.com/2/events?venue.state=CA&venue.city=#{geolocation.data["city"]}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    parsed_crap = JSON.parse(response)
    @event_list = parsed_crap["events"]
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
