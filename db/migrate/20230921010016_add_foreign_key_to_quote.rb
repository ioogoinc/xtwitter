class AddForeignKeyToQuote < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :quote, :tweet, column: :tweet_quote_id
    add_foreign_key :quote, :tweet, column: :quoted_tweet_id
    add_foreign_key :quote, :user, column: :quoting_user_id
    #add FK to table:  from table: , that is column:
  end
end
