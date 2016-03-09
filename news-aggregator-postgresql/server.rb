require "sinatra"
require "pg"
require_relative "./app/models/article"
require 'pry'

## Can't get rspec tests to pass:
#
# 1) user adds article user successfully adds an article
#     Failure/Error: click_button "Submit"
# 
#     NoMethodError:
#       undefined method `status=' for #<PG::Result:0x007fd5eaa91cb8>
#     # ./spec/features/user_adds_article_spec.rb:13:in `block (2 levels) in <top (required)>'
#     # ------------------
#     # --- Caused by: ---
#     # NoMethodError:
#     #   undefined method `headers' for #<PG::Result:0x007fd5eaa91cb8>
#     #   ./spec/features/user_adds_article_spec.rb:13:in `block (2 levels) in <top (required)>'
#
#  2) user sees all articles user views articles with their title, url, and description
#     Failure/Error: visit "/articles"
#
#     NoMethodError:
#       undefined method `status=' for #<PG::Result:0x007fd5eaa74be0>
#     # ./spec/features/user_sees_articles_spec.rb:18:in `block (2 levels) in <top (required)>'
#     # ------------------
#     # --- Caused by: ---
#     # NoMethodError:
#     #   undefined method `headers' for #<PG::Result:0x007fd5eaa74be0>
#     #   ./spec/features/user_sees_articles_spec.rb:18:in `block (2 levels) in <top (required)>'



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
