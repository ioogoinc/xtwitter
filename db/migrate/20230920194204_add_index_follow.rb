class AddIndexFollow < ActiveRecord::Migration[7.0]
  def change
    add_index :follows, [:follower_id, :followee_id], unique:true, comment:"Unique index to make sure that the user can not
    follow the same user more than one time" 
  end
end
