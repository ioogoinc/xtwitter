class Like < ApplicationRecord
    belongs_to :user
    belongs_to :tweet

    validates :user_id, uniqueness: { scope: :tweet_id, message: "You can only like a tweet once" }
end
