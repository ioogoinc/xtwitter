class Tweet < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id

  belongs_to :retweeted_tweet, class_name: Tweet, foreign_key: retweet_Id, optional: true
  belongs_to :quoted_tweet, class_name: Tweet, foreign_key: quote_id, optional: true

  has_many :replies, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :taggings
  has_many :hashtags

  # validates only when is a tweet or a quote, retweet null
  #presence validation for a tweet body and length validation for 255 chars
  validates :content, length: {maximum : 255}, presence: true
  #when is a retweet it should be null

  #dont run this validations bc user has already been created
  #fulfilling its validations at the beginning.
  # validates_associated :user

  validates_associated :replies
  #validates_associated :bookmarks
  #validates_associated :likes
  #validates_associated :hashtags

  #falta el modelo de quotes
end