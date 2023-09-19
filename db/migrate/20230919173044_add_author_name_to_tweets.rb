class AddAuthorNameToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :author_name, :string
    add_index :tweets, :author_name
  end
end
