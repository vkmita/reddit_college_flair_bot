class User < ActiveRecord::Base
  validates_presence_of :username
  validates_length_of :username, :maximum => 20

  has_many :subreddits
  has_many :authentications


  devise :confirmable
end
