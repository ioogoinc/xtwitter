class Follower < ApplicationRecord
    belongs_to :author, class_name: 'Author', foreign_key: :author_id
    validates_associated :author
    validates :follower_id, uniqueness: {scope:followee_id}
end
