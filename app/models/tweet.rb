class Tweet < ApplicationRecord
  has_and_belongs_to_many :hastags
  belongs_to :author, class_name: 'Author', foreign_key: :author_id

  validates :body, presence: true, length: {maximum: 255}, if: :not_retweet
  validates :body, presence: false, if: !:not_retweet
  validates :other_tweet_id, presence: true, if: !:not_retweet || :is_quote
  validates_associated :author

  def not_retweet
    tweet_type != "retweet"
  end

  def is_quote 
    tweet_type == 'quote'
  end


end
