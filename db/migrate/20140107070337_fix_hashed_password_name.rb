class FixHashedPasswordName < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :hashed_password, :password_hash
    end
  end
end
