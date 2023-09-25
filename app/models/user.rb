class User < ApplicationRecord
    has_many :followees, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followers,foreign_key: :followee_id, class_name: 'Follow'
    has_many :tweets
    has_many :replies
    has_many :bookmarks
    has_many :likes
    # has_many :retweets, foreign_key: :retweet_id, class_name: 'Tweet'
    # has_many :quotes, foreign_key: :quote_id, class_name: 'Tweet'

    validates :email, :username, presence: true, 
        uniqueness: true
    validates :password,
        presence: true, 
        length: {minimum: 12}, 
        format: { with: /(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])/ }
        

    scope :followers_count_by_user, -> (user_id) { where(id: user_id).joins(:followers).count }

    scope :following_count_by_user, -> (user_id) { where(id: user_id).joins(:followees).count }


    scope :retweets_count, ->  (tweet_id) do
        joins(:retweets).where('tweets.retweet_id = ?', tweet_id).count
    end

    scope :quotes_count, ->  (tweet_id) do
        joins(:quotes).where('tweets.quote_id = ?', tweet_id).count
    end

    scope :bookmarks_tweet_by_user, ->  (user_id) do
        joins(:bookmarks).where(users: {id: user_id})
    end

end