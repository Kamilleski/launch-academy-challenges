require 'sinatra'

get "/" do
erb :index
end

get "/launcher-bucket-list" do
  @list = CSV.readlines("bucket_list.csv", headers: true)
  erb :index
end

post "/launcher-bucket-list" do
  list_item = params[:list_item]
  unless list_item.strip.empty?
    CSV.open("bucket_list.csv", "a") do |file|
      file << [list_item]
    end
  redirect "/launcher-bucket-list"
  end
end
