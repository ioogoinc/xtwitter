class Follow < ApplicationRecord
    belongs_to :follower_user_id, class_name: 'User'
    belongs_to :followee_user_id, class_name: 'User'
    validates :follower_user_id, uniqueness: true
    validates :followee_user_id, uniqueness: true
    validates_associated  :follower_user_id, :followee_user_id
end
