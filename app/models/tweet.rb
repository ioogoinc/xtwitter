class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :parent_tweet, class_name: "Tweet", optional: true
  enum :classification, {
    retweet:  "RETWEET",
    reply:    "REPLY",
    quote:    "QUOTE",
    tweet:    "TWEET"
  }
end
