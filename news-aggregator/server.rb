require 'sinatra'
require 'pry'

get '/articles' do
  @articles = File.readlines('articles.txt')
  erb :index
end

get '/articles/new' do
  erb :show
end

post '/articles/new' do
  title = params['title']
  url = params['url']
  description = params['description']


  File.open('articles.txt', 'a') do |file|
    file.puts(title, url, description)
  end

  redirect '/articles'
end
