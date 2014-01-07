class User < ActiveRecord::Base
  include BCrypt

  validates_presence_of :username, :password_hash
  validates_length_of :username, :maximum => 20
  validates :reddit_credentials

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  private

  def reddit_credentials
    client = Reddit::Client.new(self)
    response = client.log_in
    unless response.code == 200
      errors.add(:username, I18n.t('user.errors.invalid_reddit_credentials'))
    end
  end
end
