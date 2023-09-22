class Like < ApplicationRecord
    belongs_to :liking_user, class_name: "User"
    belongs_to :liked_tweet, class_name: "Tweet"

     #created the validation for only having 1 like per tweet per user
    validates :liking_user_id, 
        uniqueness: {scope: :liked_tweet}

    #created the association validation for the relations between tables user & tweet to like
    validates_associated :liking_user, :liked_tweet


    scope :likes_by_user, ->(using_user) { where(liking_user_id: using_user)}
    scope :likes_count, ->(tweet_info)  { where(liked_tweet: tweet_info).count}

    
    def liking (user_you, tweet_case)
         Like.new liking_user_id:user_you, liked_tweet_id:tweet_case
    end
end
