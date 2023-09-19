class Bookmark < ApplicationRecord
    bolongs_to :user, class_name: User, foreign_key: :user_id
    has_one :tweet, class_name: Tweet, foreign_key: :tweet_id
end
