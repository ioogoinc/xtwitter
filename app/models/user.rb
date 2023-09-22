class User < ApplicationRecord
    has_many :followees, foreign_key: :follower_id, class_name: 'Follow'

    has_many :followers,foreign_key: :followee_id, class_name: 'Follow'
    has_many :tweets
    has_many :replies
    
    validates :email, :username, presence: true, 
        uniqueness: true
    validates :password,
        presence: true, 
        length: {minimum: 12}, 
        format: { with: /(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])/ }

    scope :followers_count_by_user, -> (user_id) { where(id: user_id).joins(:followers).count }

    scope :following_count_by_user, -> (user_id) { where(id: user_id).joins(:followees).count }
end




