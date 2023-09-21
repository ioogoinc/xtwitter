class Author < ApplicationRecord
    has_many :tweets, class_name: 'Tweet', foreign_key: :username
    has_many :followers, class_name: 'Follower', foreign_key: :followee_id
    has_many :followee, class_name: 'Follower', foreign_key: :follower_id
    has_many :bookmarks, class_name: 'Bookmark', foreign_key: :username
    has_many :likes, class_name: 'Like', foreign_key: :username

    validates  :username, :email, presence: true, uniqueness: true
    validates :password, format: {with: /(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@$\/*\-+_]).{12,}/}

end
