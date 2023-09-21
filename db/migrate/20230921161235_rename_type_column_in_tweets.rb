class RenameTypeColumnInTweets < ActiveRecord::Migration[7.0]
  def change
    rename_column :tweets, :type, :tweet_type 
  end
end
