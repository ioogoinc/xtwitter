class AddQuote < ActiveRecord::Migration[7.0]
  def change
    add_reference :tweets, :quote_id
  end
end
