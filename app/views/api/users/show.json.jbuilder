json.user do
    json.extract! @user, :name, :lastname, :username, :bio
    json.followers @followers_count
    json.followings @followings_count
    json.tweets @user_tweets do |tweet|
        json.id tweet.id
        json.body tweet.body
        json.ahuthor tweet.author.username
        json.parent_tweet do
            json.id tweet.parent_tweet.id
            json.body tweet.parent_tweet.body
        end
        json.stats do
            json.likes tweet.likes.count
            json.quotes tweet.quotes.count
            json.retweets tweet.retweets.cont
        end
    end
    json.tweets_and_replies @tweets_and_replies do |tweet|
        json.id tweet.id
        json.body tweet.body
        json.ahuthor tweet.author.username
        json.parent_tweet do
            json.id tweet.parent_tweet.id
            json.body tweet.parent_tweet.body
        end
        json.stats do
            json.likes tweet.likes.count
            json.quotes tweet.quotes.count
            json.retweets tweet.retweets.cont
        end
    end
end
# {
#     user: {
#         name: "sasasas",
#         lastname: "sasasas",
#         username: "sasasas",
#         email: "sasasas",
#         passwo: "sasasas"
#     }
# }