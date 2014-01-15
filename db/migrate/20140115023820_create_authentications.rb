class CreateAuthentications < ActiveRecord::Migration
  def change
    if Rails.env.production?
      create_table :authentications do |t|
        t.integer  "user_id"
        t.string   "provider"
        t.string   "uid"
        t.datetime "created_at"
        t.datetime "updated_at"
      end
    end
  end
end
