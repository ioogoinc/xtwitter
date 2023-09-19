class Like < ApplicationRecord
    belongs_to :tweet, class_name: Tweet, foreign_key: :tweet_id
    belongs_to :user, class_name: User, foreign_key: :user_id
end
