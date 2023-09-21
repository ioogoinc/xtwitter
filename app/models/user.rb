class User < ApplicationRecord
    has_many :followed_users, foreign_key: :follower_user_id, class_name: 'Follow'has_many :followees, through: :followed_users
    has_many :following_users, foreign_key: :followee_user_id, class_name: 'Follow'  has_many :followers, through: :following_users
    has_and_belongs_to_many :Tweet, join_table: "table_name", foreign_key: "Tweet_id"
    has_many :tweets, foreign_key: "tweeting_user_id"
    has_many :likes, foreign_key: "liking_user_id"
    has_many :bookmarks, foreign_key: "bookmarking_user_id"
    has_many :quotes, foreign_key: "quoting_user_id"
    has_many :retweets, foreign_key: "retweeting_user_id"
    validates :username, uniqueness: true, length: {within: (1...20)}, presence: { message: "must be given a username" }
    validates :email, uniqueness: true, presence: { message: "must be given a username" }
    validates :password, uniqueness: true, length: {within: (12...30)}, presence: true, format: { with: /(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])/ , message:
        "Password must contain, At least 1 uppercase letter, at least 1 lowercase letter, at least 1 number and at least 1 special character like !@/*-+_"}
    validates :display_name, length: {within: (1...20)}}