require 'sinatra/base'
require_relative '../data_mapper_setup'

class BlogApp < Sinatra::Base
  PERMITTED_PARAMS = [:email, :username, :name, :phone, :password, :password_confirmation]
  enable :sessions
  use Rack::MethodOverride

  get '/' do
    'Hello BlogApp!'
    erb :'index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(permitted_params(params))
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/'
  end

  get '/blogs' do
    @blogs = Blog.all
    erb :'blogs/index'
  end

  get '/blogs/new' do
    erb :'blogs/new'
  end

  post '/blogs' do
    blog = Blog.create(content: params[:content], title: params[:title])
    tag = Tag.create(name: params[:tag])
    blog.tags << tag
    blog.save
    redirect to('/blogs')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @blogs = tag ? tag.blogs : []
    erb :'blogs/index'
  end

  def permitted_params(parameters)
    parameters.select{|k,v| PERMITTED_PARAMS.include?(k.to_sym)}
  end

  def current_user
    current_user ||= User.get(session[:user_id])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
  end
