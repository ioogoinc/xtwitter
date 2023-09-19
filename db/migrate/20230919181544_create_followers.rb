class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.integer :follow_id
      t.integer :follower_id

      t.timestamps
    end

    add_foreign_key :followers, :users, column: :follow_id
    add_foreign_key :followers, :users, column: :follower_id
  end
end
