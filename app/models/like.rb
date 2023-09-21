class Like < ApplicationRecord
    belongs_to :user
    belongs_to :tweet

    validates :tweet_id, :user_id, uniqueness: true
end
