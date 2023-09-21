class AddUserPassword < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :password, :string, limit: 12, null: false
  end
end
