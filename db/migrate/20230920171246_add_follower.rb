class AddFollower < ActiveRecord::Migration[7.0]
  def change
    add_column :follows, :follower_id, :integer
  end
end
