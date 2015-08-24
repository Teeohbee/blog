require 'sinatra/base'
require_relative '../data_mapper_setup.rb'

class Blogs < Sinatra::Base
  get '/' do
    'Hello Blog!'
  end

  get '/BlogFeed' do
    @blogs = Blog.all
    erb :'blogs/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
