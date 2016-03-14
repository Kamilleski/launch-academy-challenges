require "sinatra"
require "pg"

configure :development do
  set :db_config, { dbname: "grocery_list_development" }
end

configure :test do
  set :db_config, { dbname: "grocery_list_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

def groceries_all
  db_connection do |conn|
    sql_query = "SELECT * FROM groceries"
    conn.exec(sql_query)
  end
end

def grocery_save(params)
  unless params["name"].empty?
    db_connection do |conn|
      sql_query = "INSERT INTO groceries (name) VALUES ($1)"
      data = [params["name"]]
      conn.exec_params(sql_query, data)
    end
  end
end

def grocery_find(id)
  db_connection do |conn|
    sql_query = "SELECT * FROM groceries WHERE id = $1"
    data = [id]
    conn.exec_params(sql_query, data).first
  end
end

def grocery_comments(id)
  db_connection do |conn|
    sql_query = "SELECT groceries.*, comments.* FROM groceries
        JOIN comments ON groceries.id = comments.grocery_id
        WHERE groceries.id = $1"
    data = [id]
    conn.exec_params(sql_query, data)
  end
end

get "/" do
  redirect "/groceries"
end

get "/groceries" do
  @groceries = groceries_all
  erb :groceries
end

post "/groceries" do
  grocery_save(params)
  redirect "/groceries"
end

get "/groceries/:id" do
  @grocery = grocery_find(params[:id])
  @comments = grocery_comments(params[:id]).to_a
  erb :show
end
