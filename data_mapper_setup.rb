require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/blog_#{env}")

require './app/models/blog.rb'
require './app/models/tag.rb'

DataMapper.finalize

DataMapper.auto_upgrade!
