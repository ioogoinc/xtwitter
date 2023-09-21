class Bookmark < ApplicationRecord
  belongs_to :bookmarked_tweet, class_name: "Tweet"
  belongs_to :bookmarking_user, class_name: "User"
  validates :bookmarked_tweet_id, uniqueness: true
  validates :bookmarking_user_id, uniqueness: true
end
