class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, limit: 20
      t.string :hashed_password

      t.timestamps
    end
  end
end
