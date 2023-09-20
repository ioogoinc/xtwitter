class AddForeignKeysToRetweet < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :retweet, :users, column: :retweeting_user_id
    add_foreign_key :retweet, :tweet, column: :retweeted_tweet_id
    #add FK to table:  from table: , that is column:
  end
end
