class Tweet < ApplicationRecord
    belongs_to :user
    belongs_to :parent_tweet,  class_name: 'Tweet', optional: true
    has_many :retweets, class_name: 'Tweet', foreign_key: :retweet_id
    has_many :quotes, class_name: 'Tweet', foreign_key: :quote_id
    has_many :replies, class_name: 'Tweet', foreign_key: :parent_tweet_id
    has_many :hashtags, through: :hashtag_tweets, inverse_of: :tweets
    has_many :bookmarks
    has_many :likes
    has_many :hashtag_tweets


    validates_associated :user
    validates_associated :retweets
    validates_associated :quotes

    validates :body, length: {maximum: 255}
    validates :body, presence: true, if: :tweet_or_quote?


    def tweet_or_quote?
        retweet_id.nil?
    end

    scope :tweets_by_user, ->(user_id) { where(user_id: user_id, parent_tweet_id: nil) }
    scope :tweets_and_replies_by_user, ->(user_id) { where(user_id: user_id)}
    scope :retweets_count, ->  (user_id) { where(user_id: user_id).where.not(retweet_id: nil).count }
    scope :quotes_count, ->  (user_id) { where(user_id: user_id).where.not(quote_id: nil).count }
    scope :bookmarks_tweet_by_user, ->  (user_id) do
        joins(:bookmarks).where(bookmarks: {user_id: user_id})
    end

    def self.create_retweet(user, tweet_to_retweet) 
        retweet = Tweet.new(
          body: nil,
          user_id: user,
          retweet_id: tweet_to_retweet,    
        )
        retweet
    end

    def self.create_quote(user, new_body)
        quote = Tweet.new(
          body: new_body,
          user_id: user,
        )
        
        quote.save!
        quote.update(
          quote_id: quote.id
          )
        quote
    end


     def self.create_like(user) 
        retweet = Tweet.new(
          body: nil,
          user_id: user,
          retweet_id: tweet_to_retweet,    
        )
    
        retweet.save!
        retweet
    end

    

end
