class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates_associated :user
  validates_associated :tweet
  
end
