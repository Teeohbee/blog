require 'sinatra/base'
require_relative 'data_mapper_setup'



class BlogApp < Sinatra::Base
  PERMITTED_PARAMS = [:email, :username, :name, :phone, :password, :password_confirmation]
  get '/' do
    'Hello BlogApp!'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(permitted_params(params))
    user.save
    @user = user.username
    erb :'index'
  end

  def permitted_params(parameters)
    parameters.select{|k,v| PERMITTED_PARAMS.include?(k.to_sym)}
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end