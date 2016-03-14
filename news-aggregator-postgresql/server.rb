require "sinatra"
require "pg"
require_relative "./app/models/article"
require 'pry'

## Can't get rspec tests to pass

set :views, File.join(File.dirname(__FILE__), "app", "views")

configure :development do
  set :db_config, { dbname: "news_aggregator_development" }
end

configure :test do
  set :db_config, { dbname: "news_aggregator_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

get '/' do
  redirect '/articles'
end

get '/articles' do
  printer = "SELECT title, url, description FROM articles;"
  @response = db_connection { |conn| conn.exec(printer) }
  binding.pry
  erb :index
end

post '/articles/new' do
  @title = params['title']
  @url = params['url']
  @description = params['description']

  sql = "INSERT INTO articles (title, url, description) VALUES ($1, $2, $3);"

  db_connection do |conn|
    conn.exec_params(sql, [@title, @url, @description])
  end

  redirect '/articles'
end

get '/articles/new' do
  erb :show
end
