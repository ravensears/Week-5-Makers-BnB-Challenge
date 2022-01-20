require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/user'
require './lib/space'

class Cherbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  enable :sessions

  get '/' do
    @user = User.find(id: session[:user_id])
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    session[:user] = User.create(name: params[:name], username: params[:username], 
      email: params[:email], password: params[:password])

    session[:user_id] = session[:user].id
    redirect '/'
  end

  get '/spaces/new' do
    erb :new_spaces
  end

  get '/spaces' do
    @space = Space.all
    erb :spaces
  end

  get '/spaces/:id' do
    @message = session[:message]
    erb :"requests/booking"
  end

  post '/requests' do
    session[:message] = 'Your request was successfully submitted to Cher'
    redirect '/spaces/:id'
  end

  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], 
      start_date: params[:start_date], end_date: params[:end_date])
    redirect '/spaces'
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $0
end
