class AddForeignKeysToLikes < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :like, :users, column: :follower_user_id
    add_foreign_key :like, :tweet, column: :liked_tweet_id
    #add FK to table:  from table: , that is column:
  end
end
