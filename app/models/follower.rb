class Follower < ApplicationRecord
    belongs_to :user, class_name: User, foreign_key: :follow_id
end
