require_relative 'tag'
class Blog
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, :length => 6000
  property :title, String
  property :time, Time

  has n, :tags, through: Resource
  has n, :comments, through: Resource

  belongs_to :user
  validates_presence_of :content
end
