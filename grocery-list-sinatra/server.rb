require 'sinatra'
require 'csv'

get "/" do
  redirect "/groceries"
end

get "/groceries" do
  @list = CSV.readlines("grocery_list.csv", headers: true)
  erb :index
end

post "/groceries" do
  @grocery_item = params[:grocery_item]
  @item_quantity = params[:item_quantity]
  unless @grocery_item.strip.empty?
    CSV.open("grocery_list.csv", "a") do |file|
      file.puts([@grocery_item, @item_quantity])
    end
  end
  redirect "/groceries"
end

get "/groceries/:grocery_item" do
  @grocery_item = params[:grocery_item]

  erb :show
end
