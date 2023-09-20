class User < ApplicationRecord
    has_many :tweets
    has_many :likes
    has_many :bookmarks
    has_and_belongs_to_many :followers
end
