class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.integer :user_id
      t.string :fullname
      t.string :twitter_username
      t.string :facebook_username

      t.timestamps
    end
  end
end
