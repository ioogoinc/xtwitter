class CreateJoinTableHastagsTweets < ActiveRecord::Migration[7.0]
  def change
    create_join_table :hastags, :tweets do |t|
      # t.index [:hastag_id, :tweet_id]
      # t.index [:tweet_id, :hastag_id]
    end
  end
end
