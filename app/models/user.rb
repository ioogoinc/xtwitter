class User < ApplicationRecord
    has_many :followed_users, foreign_key: :follower_user_id, class_name: 'Follow'has_many :followees, through: :followed_users
    has_many :following_users, foreign_key: :followee_user_id, class_name: 'Follow'  has_many :followers, through: :following_users
    has_and_belongs_to_many :Tweet, join_table: "table_name", foreign_key: "Tweet_id"
end