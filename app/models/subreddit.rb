class Subreddit < ActiveRecord::Base
  validates_presence_of :moderator, :name
  validate :validate_moderator_can_moderate

  has_many :moderator, :class_name => "Moderator"
  has_many :users

  private

  def validate_moderator_can_moderate
    moderator.can_moderate?(name)
  end
end
