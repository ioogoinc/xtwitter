class User < ApplicationRecord
  has_many :tweets, dependent: :destroy


  # tweet contains bookmarks, also a user can read its bookmarks
  has_many :bookmarks
  # tweet contains likes, also a user can see its likes
  has_many :likes

  #tweet contains replies
  #has_many :replies

  has_many :followers, foreign_key: :follower_id, class_name: 'Follow'

  has_many :followee, foreign_key: :followee_id, class_name: 'Follow'
  
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
