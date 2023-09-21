class AddForeignKeyToTweet < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :tweet, :user, column: :tweeting_user_id

  end
end
