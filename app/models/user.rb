class User
  include DataMapper::Resource
  attr_accessor :passwordconfirm
  attr_reader :password

  property :id, Serial
  property :email, String
  property :username, String
  property :name, String
  property :phone, String
  property :password_digest, Text
  
  def password=(password)
  end

end