class Tweet < ApplicationRecord
  belongs_to :user
  #has_and_belongs_to_many :hashtags
  has_one :user class_name: Users, foreign_key: :author_id
  belongs_to :retweeted_tweet, class_name: 'Tweet', foreign_key: 'retweet_Id', optional: true
  belongs_to :quoted_tweet, class_name: 'Tweet', foreign_key: 'quote_id', optional: true

  has_many :replies, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :hashtags, through: :taggings
end