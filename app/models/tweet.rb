class Tweet < ApplicationRecord
    belongs_to :user
    has_many :retweets, class_name: 'Tweet', foreign_key: :retweet_id
    has_many :quotes, class_name: 'Tweet', foreign_key: :quote_id

    validates :body, length: {maximum: 255}
    validates :body, presence: true, if: :tweet_or_quote?

    def tweet_or_quote?
        retweet_id_id.nil?
    end

end
