class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates_associated :user
  validates_associated :tweet

  validates :body, presence: true, length: {maximum: 255}

  
end
