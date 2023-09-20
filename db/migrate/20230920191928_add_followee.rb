class AddFollowee < ActiveRecord::Migration[7.0]
  def change
    add_column :follows, :followee_id, :integer
  end
end
