require 'sinatra/base'
require_relative 'data_mapper_setup'

class BlogApp < Sinatra::Base
  get '/' do
    'Hello BlogApp!'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/user' do
    
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
