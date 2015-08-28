require_relative 'tag'
require_relative 'imageuploader'

class Blog
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, :length => 6000
  property :title, String
  property :time, Time

  mount_uploader :image, ImageUploader

  has n, :tags, through: Resource
  has n, :comments, through: Resource

  belongs_to :user
  validates_presence_of :content

end
