class RenameUsernameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :username, :author_id
  end
end
