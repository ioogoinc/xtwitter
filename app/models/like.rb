class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates_associated :user
  validates_associated :tweet

  validates :user_id, uniqueness: { scope: :tweet_id}
end
