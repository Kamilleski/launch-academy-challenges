require "sinatra"
require "pg"
require "pry"

configure :development do
  set :db_config, { dbname: "poros_development" }
end

configure :test do
  set :db_config, { dbname: "poros_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

def all_poros
  all = nil
  db_connection do |conn|
    all = conn.exec("SELECT name FROM poros;")
  end
  all
end

def create_poro(name)
  db_connection do |conn|
    sql_query = "INSERT INTO poros (name) VALUES ($1)"
    conn.exec_params(sql_query, [name])
  end
end

get "/" do
  redirect "/poros"
end

get "/poros" do
  @poros = all_poros
  erb :index
end

post "/poros" do
  name = params[:name]
  create_poro(name) unless name.strip.empty?
  redirect "/poros"
end
