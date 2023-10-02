json.extract! tweet, :id, :user_id, :body, :type, :parent_tweet_id, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
