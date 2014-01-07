class Subreddit < ActiveRecord::Base
  validates_presence_of :moderator, :name
  validates :moderator_can_moderate

  has_one :moderator, :class_name => "Moderator"
  has_many :users

  private

  def moderator_can_moderate
    moderator.can_moderate?(name)
  end
end
