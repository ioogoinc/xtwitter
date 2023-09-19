class HashtagTweet < ApplicationRecord
    belongs_to :hashtag, class_name: Hashtag, foreign_key: :hashtag_id
    belongs_to :tweet, class_name: Tweet, foreign_key: :tweet_id
end
