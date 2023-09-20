class Hashtag < ApplicationRecord
  has_many :hashtags_tweets
  has_namy :tweets, through: :hashtags_tweets
end
