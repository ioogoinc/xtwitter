class Follower < ApplicationRecord
  has_and_belongs_to_many :users,
    class_name: "User",
    foreign_key: "follow_id"
end
