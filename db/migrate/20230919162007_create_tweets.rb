class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.references :users, foreign_key: true
      t.integer :other_tweet_id, null: true
      t.string :type
      t.text :body, limit: 480

      t.timestamps
    end
  end
end
