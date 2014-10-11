require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :fullname, String
  property :username, String, unique: true, message: "This username is already taken"
  property :email, String, unique: true, message: "This email is already taken" 
  property :password_digest, Text

  has n, :peeps, through: Resource

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    return user if equal_password_for?(user, password)
  end

  def self.from(params)
    create(params)
  end

  def self.equal_password_for?(user, password)
    user && BCrypt::Password.new(user.password_digest) == password
  end
end
