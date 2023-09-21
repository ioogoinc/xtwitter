class User < ApplicationRecord
    has_many :followers, class_name: 'follow', foreign_key: :follower_id
    has_many :followees, class_name: 'follow', foreign_key: :followee_id

    validates :email, :username, presence: true, 
        uniqueness: true
    validates :password,
        presence: true, 
        length: {minimum: 12}, 
        format: { with: /(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*()_+])/ }
end
                                                             