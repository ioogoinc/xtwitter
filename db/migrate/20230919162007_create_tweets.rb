class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      add_reference :users, :user, foreign_key: true 
      t.integer :tweet_id # Needs more research on applying foreign key after creation of table
      t.string :type # enum: [retweet, reply, quote, thread]
      t.text :body, limit: 480

      t.timestamps
    end

    change_column :tweets, :tweet_id, :integer, null: true
  end
end
