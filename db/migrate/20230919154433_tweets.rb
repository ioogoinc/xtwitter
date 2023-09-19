class Tweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.belongs_to :users
      t.text :body
      t.boolean :retweet
      t.boolean :quotes
      t.timestamp :created_at
    end
  end
end
