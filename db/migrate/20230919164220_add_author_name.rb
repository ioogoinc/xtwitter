class AddAuthorName < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :author_name, :string
  end
end
