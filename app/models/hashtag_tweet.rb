class HashtagTweet < ApplicationRecord
  belongs_to :hashtag
  belongs_to :tweet

  validates_associated :hashtag
  validates_associated :tweet

end
