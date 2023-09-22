class Tweet < ApplicationRecord
    belongs_to :user
    has_many :retweets, class_name: 'Tweet', foreign_key: :retweet_id
    has_many :quotes, class_name: 'Tweet', foreign_key: :quote_id
    has_many :replies
    has_many :hashtags
    has_many :bookmarks

    validates_associated :user
    validates_associated :retweets
    validates_associated :quotes

    validates :body, length: {maximum: 255}
    validates :body, presence: true, if: :tweet_or_quote?

    def tweet_or_quote?
        retweet_id.nil?
    end

    scope :tweets_by_user, ->(user_id) { where(user_id: user_id) }

    scope :tweets_and_replies_by_user, ->(user_id) do
        where(user_id: user_id).includes(:replies)
    end

    def self.create_retweet(user_id) 

        orig_tweet = Tweet.find_by(retweet_id:nil, user_id: user_id )

        if orig_tweet.nil?
            return nil
        end

        retweet= Tweet.new(user_id: user_id, retweet_id: orig_tweet.id)

        if retweet.save
            return retweet
        else
            return nil
        end
    end


end
