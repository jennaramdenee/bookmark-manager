require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id,             Serial
  property :email,          String
  property :password_hash,  Text

  @@count = 0

  def self.count
    @@count
  end

  def password=(password)
    self.password_hash = Password.create(password)
  end
end
