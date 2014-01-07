class Subreddit < ActiveRecord::Base
  validates_presence_of :moderator, :name

end
