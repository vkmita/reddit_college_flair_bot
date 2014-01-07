class RemoveModeratorIdFromSubbredits < ActiveRecord::Migration
  def self.up
    remove_column :subreddits, :user_id
  end

  def self.down
    add_column :subreddits, :user_id, :integer
  end
end
