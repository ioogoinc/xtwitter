class Quote < ApplicationRecord
  belongs_to :bookmarked_tweet, class_name: "Tweet"
  belongs_to :bookmarking_user, class_name: "User"
  validates :quote_body, length: {within: (1...255)}, presence: { message: "must be given please" }
  
end
