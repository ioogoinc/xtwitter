class Follow < ApplicationRecord
    belongs_to :follower, class_name: 'User'
    belongs_to :followee, class_name: 'User'


    validates_associated :followee
    validates_associated :follower

    validates :follower_id, uniqueness: { scope: :followee_id}

end
