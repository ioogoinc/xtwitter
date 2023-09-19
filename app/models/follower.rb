class Follower < ApplicationRecord
  belongs_to :followerID
  belongs_to :followeeID
end
