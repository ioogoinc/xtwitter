class Like < ApplicationRecord
    belongs_to :author, class_name: 'Author', foreign_key: :author_id
    belongs_to :tweet, class_name: 'Tweet', foreign_key: :tweet_id

    validates :username, uniqueness: {scope:tweet_id}
    validates_associated :author
    validates_associated :tweet
    
end
