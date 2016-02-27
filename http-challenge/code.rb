require "nokogiri"
require "pry"
require 'HTTParty'

response = HTTParty.get('https://launch-academy-chat.herokuapp.com/messages')

puts response.body

message = pure-u-1-2 content

html = Nokogiri::HTML(response.body)
html.css("div.'pure-u-1-2 content'").each do |'pure-u-1-2 content'|
  puts 'pure-u-1-2 content'.text
end

binding.pry
