class User < ApplicationRecord
  has_many :tweets
  has_many :bookmarks
  has_many :likes
  #has_many :replies
  has_many :followed_users, foreign_key: :follower, class_name: Follow
  #check this
  has_many :followers, through: :followed_users

  #presence validation for email and username
  validates :username, email, presence: true
  #validates uniqueness for email and username
  validates :username, :email, uniqueness: true
  #validates presence for password
  validates :password, presence: true
  #validates password for length minimum of 12 chars
  validates :password, length: {minumum : 12}
  #validates format at least 1 uppercase letter, at least 1 lowercase letter, 
  #at least 1 number and at least 1 special character like !@/*-+_
  validates :password, format: { with: ^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@/*\-+_]).*$}
end
