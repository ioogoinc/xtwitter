class AddForeignKeysToFollows < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :follows, :users, column: :follower_user_id
    add_foreign_key :follows, :users, column: :followee_user_id
  end
end
