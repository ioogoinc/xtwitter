class Follow < ApplicationRecord

    validates :followee_id, :follower_id, uniqueness: true
end
