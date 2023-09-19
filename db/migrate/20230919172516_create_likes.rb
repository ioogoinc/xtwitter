class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :tweets, foreign_key: true, index: false
      t.references :users, foreign_key: true, index: false
 
      t.timestamps
    end
  end
end
