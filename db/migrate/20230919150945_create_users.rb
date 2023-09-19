class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password, comment: 'This data type will be changed on validations.'
      t.boolean :private

      t.timestamps
    end
  end
end
