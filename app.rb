require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/user'
require './lib/space'

class Cherbnb < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @user = User.find(id: session[:user_id])
    @message = session[:message]
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
    @error_email_message = session[:error_email_message]
    erb :'/sessions/new'
  end

  post '/sessions/destroy' do
    session.clear
    session[:message] = 'You have signed out.'
    #flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user 
      session[:user_id] = user.id
      session[:message] = nil
      redirect '/'
    else 
      session[:error_email_message] = 'Please check your email or password'
      redirect '/sessions/new'
    end
  end

  run! if app_file == $0
end
