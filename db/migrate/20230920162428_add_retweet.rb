class AddRetweet < ActiveRecord::Migration[7.0]
  def change
    add_reference :tweets, :retweet
  end
end