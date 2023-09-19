class Likes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.belongs_to :users
      t.belongs_to :tweets     
      t.timestamp :created_at
    end
  end
end
