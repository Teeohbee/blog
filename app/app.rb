require 'sinatra/base'
require_relative '../data_mapper_setup.rb'

class Blogs < Sinatra::Base
  get '/' do
    'Hello Blog!'
  end

  get '/blogs' do
    @blogs = Blog.all
    erb :'blogs/index'
  end

  get '/blogs/new' do
    erb :'blogs/new'
  end

  post '/blogs' do
    Blog.create(content: params[:content], title: params[:title])
    redirect to('/blogs')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
