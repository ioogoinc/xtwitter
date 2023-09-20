class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email_user
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end