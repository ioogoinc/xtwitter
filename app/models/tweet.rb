class Tweet < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id

  belongs_to :original_tweet, class_name: 'Tweet', foreign_key: 'retweet_id', optional: true
  belongs_to :quoted_tweet, class_name: 'Tweet', foreign_key: 'quote_id', optional: true
  belongs_to :parent_tweet, class_name: 'Tweet', foreign_key: 'comment_id', optional: true

  has_many :replies, class_name: 'Tweet', foreign_key: 'comment_id', dependent: :destroy
  has_many :retweets, class_name: 'Tweet', foreign_key: 'retweet_id', dependent: :destroy
  has_many :quotes, class_name: 'Tweet', foreign_key: 'quote_id', dependent: :destroy

  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :hashtags

  validate :content_length_for_tweets_and_quotes

  def content_length_for_tweets_and_quotes
    if retweet_id.nil? && (content.nil? || content.length > 255)
      errors.add(:content, "El contenido debe tener un máximo de 255 caracteres para tweets y quotes.")
    end
  end

  #Con esta validación, se garantiza que el contenido tenga una longitud máxima de 255 caracteres solo cuando 
  #el tweet sea un tweet original(nuevo tweet) o una cita (quote), y se permitirá que el contenido sea nulo cuando sea un retweet.

  #dont run this validations because user has already been created
  #fulfilling its validations at the beginning.
  # validates_associated :user

  validates_associated :replies
  #validates_associated :bookmarks
  #validates_associated :likes
  #validates_associated :hashtags
end