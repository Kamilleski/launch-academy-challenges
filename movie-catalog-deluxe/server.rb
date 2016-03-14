require "sinatra"
require "pg"
require 'pry'

configure :development do
  set :db_config, { dbname: "movies" }
end

configure :test do
  set :db_config, { dbname: "movies_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

def actors_list
  @actors = []
  actor_sql = "SELECT * FROM actors ORDER BY name;"
  response = db_connection { |conn| conn.exec(actor_sql) }
  response.each do |actor|
    @actors << actor
  end
end

def movies_list
  @movies = []
  movie_sql = "SELECT movies.title AS movie_title, movies.year, movies.rating, movies.id, genres.name AS genre_name, studios.name AS studio_name FROM movies
  JOIN genres ON movies.genre_id = genres.id
  JOIN studios ON movies.studio_id = studios.id
  ORDER BY movies.title;"
  response = db_connection { |conn| conn.exec(movie_sql) }
  response.each do |movie|
    @movies << movie
  end
end

def get_actor_info(id)
  specific_actor_sql = "SELECT cast_members.character, movies.title, movies.id AS movie_id, actors.name, actors.id FROM cast_members
  JOIN actors ON cast_members.actor_id = actors.id
  JOIN movies ON movies.id = cast_members.movie_id
  WHERE actors.id = $1"

  db_connection { |conn| conn.exec(specific_actor_sql, [id]) }
end

def get_character_list(id)
  @characters = []
  specific_character_sql = "SELECT cast_members.character AS character_name, movies.title, movies.id AS movie_id, actors.name AS actor_name, actors.id AS actor_id FROM cast_members
  JOIN actors ON cast_members.actor_id = actors.id
  JOIN movies ON movies.id = cast_members.movie_id
  WHERE movies.id = $1"

  response = db_connection { |conn| conn.exec(specific_character_sql, [id])}
  response.each do |character|
    @characters << character
  end
end

def get_movie_info(id)
  specific_movie_sql = "SELECT movies.title AS movie_name, movies.year, movies.synopsis, movies.rating, studios.name AS studio_name, genres.name AS genre_name FROM movies
  JOIN genres ON movies.genre_id = genres.id
  JOIN studios ON movies.studio_id = studios.id
  WHERE movies.id = $1"

  db_connection { |conn| conn.exec(specific_movie_sql, [id]) }
end

get "/" do
  erb :main
end

get "/actors" do
  actors_list

  erb :'actors/index'
end

get "/actors/:id" do
  @specific_actor = get_actor_info(params[:id])
  erb :'actors/show'
end

get "/movies" do
  movies_list
  erb :'movies/index'
end

get "/movies/:id" do
  @specific_movie = get_movie_info(params[:id])
  get_character_list(params[:id])
  erb :'movies/show'
end
