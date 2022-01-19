require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/user'
require './lib/space'


class Cherbnb < Sinatra::Base
  enable :sessions
    configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = session[:user]
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    session[:user] = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/'
  end

  get '/spaces/new' do
    erb :new_spaces
  end

  get '/spaces' do
    @space = Space.all
    erb :spaces
  end

  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], start_date: params[:start_date], end_date: params[:end_date] )
    redirect '/spaces'
  end

  run! if app_file == $0
end
