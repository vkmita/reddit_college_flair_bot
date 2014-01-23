class Moderator < User
  include BCrypt

  validates_presence_of :password_hash
  validate :validate_reddit_credentials

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def can_moderate?(subreddit)
    response = client.get_modlog(subreddit, { :limit => 1 })
    if response.code != 200
      errors.add(:username, I18n.t('user.errors.invalid_reddit_credentials'))
    end
  end

  private

  def client
    @client ||= Reddit::Client.new(self)
  end

  def validate_reddit_credentials
    response = client.log_in
    if response.code != 200
      errors.add(:username, I18n.t('user.errors.invalid_reddit_credentials'))
    end
  end
end
