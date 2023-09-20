class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.text :body
      t.references :author, null: false, foreign_key: true
      t.string :type
      t.timestamps 
    end
  end
end
