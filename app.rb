require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'

class Cherbnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/spaces/new' do
    erb :new_spaces
  end

  get '/spaces' do
    erb :spaces
  end

  post '/spaces' do
    redirect '/spaces'
  end

  run! if app_file == $0
end
