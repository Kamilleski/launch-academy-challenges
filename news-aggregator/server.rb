require 'sinatra'
require 'pry'

get '/articles' do
  @articles = File.readlines('ingredients.txt')
  erb :index
end

post '/articles/new' do
  article = params['article']

  File.open('articles.txt', 'a') do |file|
    file.puts(article)
  end

  redirect '/articles'
end
