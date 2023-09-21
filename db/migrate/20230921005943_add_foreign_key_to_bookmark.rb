class AddForeignKeyToBookmark < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :bookmark, :tweet, column: :bookmarked_tweet_id
    add_foreign_key :bookmark, :user, column: :bookmarking_user_i
    #add FK to table:  from table: , that is column:
  end
end
