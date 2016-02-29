require "nokogiri"
require 'HTTParty'

uri = URI('http://launch-academy-chat.herokuapp.com/messages')
res = Net::HTTP.get(uri)
html = Nokogiri::HTML(res)
html.css("div.content").each do |content|
  puts content.text
end
