class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      add_reference :users, :follow, foreign_key: { to_table: :users }
      add_reference :users, :follower, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
