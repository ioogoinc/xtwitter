class User < ApplicationRecord
  has_many :tweets, dependent: :destroy

  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :followers, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followee, foreign_key: :followee_id, class_name: 'Follow'
  
  #validation for presence and uniqueness for email and username
  validates :email, :username, presence: true, uniqueness: true

  #validates presence for password
  validates :password, presence: true

  #validates password for presence, format and length minimum of 12 chars
  validates :password, presence: true, format: { with: ^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@/*\-+_]).*$}, length: { minimum: 12 }
end
