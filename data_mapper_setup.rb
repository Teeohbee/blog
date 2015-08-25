require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/blogbase_#{env}")

require './app/models/blog.rb'
require './app/models/tag.rb'
require './app/models/user.rb'
require './app/models/comment.rb'

DataMapper.finalize

DataMapper.auto_upgrade!
