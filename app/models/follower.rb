class Follower < ApplicationRecord
    belongs_to :follower, class_name: 'Author'
    belongs_to :followee, class_name: 'Author' 

    validates_associated :follower
    validates_associated :followee
    validates :follower_id, uniqueness: {scope: :followee_id}
end
