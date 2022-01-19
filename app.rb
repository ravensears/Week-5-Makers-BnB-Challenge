require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/user'

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
    session[:user] = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password], )
    redirect '/'
  end

  run! if app_file == $0
end
