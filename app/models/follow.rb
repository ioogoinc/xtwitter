class Follow < ApplicationRecord
    belongs_to :follower, class_name: 'User'
    belongs_to :followee, class_name: 'User'
    validates :follower_user_id, uniqueness: true
    validates :followee_user_id, uniqueness: true
end
