class User < ApplicationRecord
    has_many :bookmarks, foreign_key: 'users_id'
    has_many :tweets, foreign_key: 'users_id'
    
    has_many :follower_relationships, foreign_key: 'follower_user_id', class_name: 'Follower'
    has_many :following_relationships, foreign_key: 'following_user_id', class_name: 'Follower'
    has_many :followers, through: :follower_relationships, source: 'follower_user'
    has_many :following, through: :following_relationships, source: 'following_user'
    
    has_many :likes, foreign_key: 'users_id'
end