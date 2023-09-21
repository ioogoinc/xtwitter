class Like < ApplicationRecord
    belongs_to :liking_user, class_name: "User"
    belongs_to :liked_tweet, class_name: "Tweet"
    validates :liked_tweet_id, uniqueness: true
    validates :liking_user_id, uniqueness: true
end
