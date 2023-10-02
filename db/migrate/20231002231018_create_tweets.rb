class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.references :user, null: false, foreign_key: true
      t.text :body
      t.string :classification, default: Tweet.classifications[:tweet]
      t.integer :parent_tweet_id

      t.timestamps
    end
    add_foreign_key :tweets, :tweets, column: :parent_tweet_id, primary_key: :id
  end
end
