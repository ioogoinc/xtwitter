class Tweet < ApplicationRecord
  enum type: {
    'Quote',
    'Reply',
    'Retweet',
    'Thread'
  }

  belongs_to :user, class_name: User, foreign_key: :user_id

  belongs_to :tweet, class_name: Tweet
  has_many :retweet, class_name: Tweet
end
