class Tweet < ApplicationRecord
  enum type: {
    'Quote',
    'Reply',
    'Retweet',
    'Thread'
  }

  has_many :retweets, class_name: Tweet
  belongs_to :tweet, class_name: Tweet
  has_many :likes, class_name: Like

  belongs_to :user, class_name: User, foreign_key: :user_id
end
