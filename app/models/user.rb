class User < ActiveRecord::Base
  validates_presence_of :username
  validates_length_of :username, :maximum => 20

  has_many :subreddits
  has_many :authentications

  devise :confirmable

  attr_accessor :omniauth_hash

  def self.initialize_by_omniauth_hash(omniauth_hash)
    username = username(omniauth_hash)
    user = find_by_username(username) || create!(:username => username)
    user.omniauth_hash = omniauth_hash
    user
  end

  def self.username(omniauth_hash)
    omniauth_hash.info.name
  end

  def subreddits_modrated
    omniauth_hash.info.moderator.data.children.map {|c| c.data.display_name}
  end

  def subreddits_subscribed
    omniauth_hash.info.subscriber.data.children.map {|c| c.data.display_name}
  end

  def email
    ''
  end
end
