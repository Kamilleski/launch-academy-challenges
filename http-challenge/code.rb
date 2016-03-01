require "nokogiri"
require 'HTTParty'
require 'pry'

## Parses what is at this URL
uri = URI('http://launch-academy-chat.herokuapp.com/messages')
## GET request
res = Net::HTTP.get(uri)
## Runs request through Nokogiri to turn elements into objects
html = Nokogiri::HTML(res)
## searches through Nokogiri html for css divs with class 'content'
html.css("div.content").each do |content|
  puts content.text
end
binding.pry
