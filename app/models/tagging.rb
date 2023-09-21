class Tagging < ApplicationRecord
  belongs_to :tagged_hashtag, class_name: "Hashtag"
  belongs_to :tagged_tweet, class_name: "Tweet"
  validates_associated :tagged_hashtag, :tagged_tweet
end
