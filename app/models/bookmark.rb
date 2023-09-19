class Bookmark < ApplicationRecord
    belongs_to :user, foreign_key: 'users_id'
    belongs_to :tweet, foreign_key: 'tweets_id'
end