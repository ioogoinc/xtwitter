class Followers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.references :follower_user, foreign_key: { to_table: :users }, index: true
      t.references :following_user, foreign_key: { to_table: :users }, index: true   
      t.timestamp :created_at
    end
  end
end
