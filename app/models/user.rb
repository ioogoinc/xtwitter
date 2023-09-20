class User < ApplicationRecor 
    has_many :followers, class_name: follow, foreign_key: :follower_id
    has_many :followees, class_name: follow, foreign_key: :followee_id
end
