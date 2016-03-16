require 'sinatra'
require_relative 'config/application'

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetup_list = Meetup.order(:name)

  erb :'meetups/index'
end

get '/meetups/new' do
  if session[:error]
    @error = session[:error]
    @name = session[:name]
    @location = session[:location]
    @description = session[:description]
    session.clear
  end

  erb :'meetups/create'
end

get '/meetups/:id' do
  @meetup = Meetup.where('id = ?', params[:id]).first
  if session[:event_created_message]
    @event_created = session[:event_created_message]
    session.delete(:event_created_message)
  end

  erb :'meetups/show'
end

post '/meetups/new' do
  name = params[:name]
  location = params[:location]
  description = params[:description]

  @id = nil
  user = current_user

  if user.nil? == false
    new_meetup = Meetup.new(name: name,
      location: location,
      description: description,
      creator: user)

      if new_meetup.valid?
        new_meetup.save
        @id = new_meetup.id
        session[:event_created_message] = "Here's your meetup!"
      else
        raise StandardError "Somehow user submitted a new meetup without all valid data."
      end
  else
    session[:error] = "You're not signed in!"
    session[:name] = name
    session[:location] = location
    session[:description] = description

    redirect "/meetups/new"
  end

  redirect "/meetups/#{@id}"
end
