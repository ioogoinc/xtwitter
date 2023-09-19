class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      add_reference :users, :user, foreign_key: true 
      add_reference :tweets, :tweet, foreign_key: true
      t.string :type # enum: [retweet, reply, quote, thread]
      t.text :body, limit: 480

      t.timestamps
    end
  end
end
