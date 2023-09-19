class CreateTweetsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets_tables do |t|
      t.string :body
      t.string :string

      t.timestamps
    end
  end
end
