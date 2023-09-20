class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.string :follower_id
      t.string :followee_id

      t.timestamps
    end
  end
end
