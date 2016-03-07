require 'sinatra'
require 'csv'

get "/" do
  redirect "/launcher-bucket-list"
end

get "/launcher-bucket-list" do
  @list = CSV.readlines("bucket_list.csv", headers: true)
  erb :index
end

post "/launcher-bucket-list" do
  list_item = params[:list_item]
  item_quantity = params[:item_quantity]
  unless list_item.strip.empty?
    CSV.open("bucket_list.csv", "a") do |file|
      file.puts([list_item, item_quantity])
    end
  redirect "/launcher-bucket-list"
  end
end
