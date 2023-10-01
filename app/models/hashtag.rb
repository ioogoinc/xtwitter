class Hashtag < ApplicationRecord
    has_many :hashtag_tweets
    has_many :tweets, through: :hashtag_tweets, inverse_of: :hashtags

    validates :name, presence: true
end
