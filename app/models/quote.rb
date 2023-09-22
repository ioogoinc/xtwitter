class Quote < ApplicationRecord
  belongs_to :quoted_tweet, class_name: "Tweet"
  belongs_to :quoting_user, class_name: "User"
  

  #created the validation for having text body in a quote
  validates :quote_body, 
    length: {within: (1...255)}, 
    presence: { message: "must be given please" }
  

  #created the association validation for the relations between tables user & tweet to quote
  validates_associated :quoted_tweet, :quoting_user


  scope :quotes_count, ->(tweet_info) { where(quoted_tweet: tweet_info).count}


  def quoting (user_you, tweet_case, quote_text)
    Quote.new quoting_user_id:user_you, quoted_tweet_id:tweet_case, quote_body:quote_text 
  end
end
