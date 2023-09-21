class Tweet < ApplicationRecord
  has_and_belongs_to_many :hastag
  belongs_to :author, class_name: 'Author', foreign_key: :author_id

  validates :body, presence: true, length: {maximum: 255}, if: :not_retweet
  validates :body, presence: false, if: !:not_retweet
  validates :other_tweet_id, presence: true, if: !:not_retweet || :not_tweet
  validates_associated :author
  validates_associated :hastag
  def not_retweet
    tweet_type != "retweet"
  end

  def not_tweet
    tweet_type != 'tweet'
  end


end
