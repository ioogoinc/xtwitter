class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.integer :follow_id
      t.integer :follower_id

      add_reference :users, :follow_id, foreign_key: { to_table: :users }
      add_reference :users, :follower_id, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
