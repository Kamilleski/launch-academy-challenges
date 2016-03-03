require 'net/http'
require 'uri'
require 'json'

uri = URI('https://api.seatgeek.com/2/events?venue.state=MA&venue.city=boston')
response = Net::HTTP.get(uri)

parsed_crap = JSON.parse(response)
kamille = parsed_crap["events"]

kamille.each do |event|
  puts "#{event["title"]} @ #{event["venue"]["name"]}"
end
