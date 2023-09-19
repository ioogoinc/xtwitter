class CreateHashtagTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :hashtags_tweets do |t|
      t.references :hashtags, foreign_key: true
      t.references :tweets, foreign_key: true

      t.timestamps
    end
  end
end
