class CreateSubreddits < ActiveRecord::Migration
  def change
    create_table :subreddits do |t|
      t.references :moderator, :user, index: true
      t.string :name, limit: 20

      t.timestamps
    end
  end
end
