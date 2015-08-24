require 'sinatra/base'

class BlogApp < Sinatra::Base
  get '/' do
    'Hello BlogApp!'
  end

  get '/users/new' do
    erb :'users/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
