class Comment
  include DataMapper::Resource

  property :id, Serial
  property :reply, Text, :length => 140 
  has n, :blogs, through: Resource
  belongs_to :user
  belongs_to :blog

  validates_presence_of :reply

end