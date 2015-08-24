require 'bcrypt'

class User
  include DataMapper::Resource
  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :email, String
  property :username, String
  property :name, String
  property :phone, String
  property :password_digest, Text

  validates_confirmation_of :password
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_uniqueness_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end