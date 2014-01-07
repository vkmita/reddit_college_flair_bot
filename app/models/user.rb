class User < ActiveRecord::Base
  include BCrypt

  validates_presence_of :username, :password_hash
  validates :reddit_credentials

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def reddit_credentials
    client = Reddit::Client.new(self)
    response = client.login
    errors.add(:username, 'This username/password combination does not work') unless response.code == 200
  end
end
