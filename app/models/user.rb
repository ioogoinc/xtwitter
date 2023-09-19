class User < ApplicationRecord
    has_many :tweets
    has_many :likes
    has_many :followers
    has_many :bookmarks
end
