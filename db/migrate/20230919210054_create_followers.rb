class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.references :followerID, null: false, foreign_key: true
      t.references :followeeID, null: false, foreign_key: true

      t.timestamps
    end
  end
end
