class AddForeignKeyToTaggin < ActiveRecord::Migration[7.0]
  def change

        add_foreign_key :taggin, :tweet, column: :tagged_tweet_id
        add_foreign_key :taggin, :hashtag, column: :tagged_hashtag_i
        #add FK to table:  from table: , that is column:




  end
end
