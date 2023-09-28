require 'rails_helper'

RSpec.describe "Tweets API", type: :request do
  describe "tweets" do
  
    let(:user) { create(:user)}
    let(:tweet) { create(:tweet, user: user)}

    it "should return 200 status for creating a tweet with /tweets" do 
      tweet_params = {body:"This is a body"}

      post "/tweets", params: {tweet: tweet_params}
      expect(response).to have_http_status(200)
    end

    it "should return match the JSON schema for a tweet with /tweets" do 
      tweet_params = {body:"This is a body"}

      post "/tweets", params: {tweet: tweet_params}

      expect(response).to response_schema('tweet')
    end


    it "should return 200 status for updating a tweet with /tweets/:id" do 
        patch "/tweets/#{tweet.id}"
        expect(response).to have_http_status(200)
    end

    it "should return match the JSON schema for a tweet with /tweets/:id" do 
        patch "/tweets/#{tweet.id}"
        expect(response).to response_schema('tweet')
    end


    it "should return 200 status for creating a like for a tweet with /tweets/:id/like" do 
      post "/tweets/#{tweet.id}/like"
      expect(response).to have_http_status(200)
    end

    it "should return match the JSON schema for a tweet with /tweets/:id/like" do 
      post "/tweets/#{tweet.id}/like"
      expect(response).to response_schema('tweet')
    end

    it "should return 200 status for deleting a like for a tweet with /tweets/:id/unlike" do 
      delete "/tweets/#{tweet.id}/unlike"
      expect(response).to have_http_status(200)
    end

    it "should return match the JSON schema for a tweet with /tweets/:id/unlike" do 
      delete "/tweets/#{tweet.id}/like"
      expect(response).to response_schema('tweet')
    end

    it "should return 200 status for creating a retweet for a tweet with /tweets/:id/retweet" do 
      post "/tweets/#{tweet.id}/retweet"
      expect(response).to have_http_status(200)
    end

    it "should return match the JSON schema for a tweet with /tweets/:id/retweet" do 
      post "/tweets/#{tweet.id}/retweet"
      expect(response).to response_schema('tweet')
    end

    it "should return 200 status for creating a quote for a tweet with /tweets/:id/quote" do 
      post "/tweets/#{tweet.id}/quote"
      expect(response).to have_http_status(200)
    end

    it "should return match the JSON schema for a tweet with /tweets/:id/quote" do 
      post "/tweets/#{tweet.id}/quote"
      expect(response).to response_schema('tweet')
    end

    it "should return 200 status for creating a reply for a tweet with /tweets/:id/reply" do 
      get "/tweets/#{tweet.id}/reply"
      expect(response).to have_http_status(200)
    end

    it "should return match the JSON schema for a tweet with /tweets/:id/reply" do 
      post "/tweets/#{tweet.id}/reply"
      expect(response).to response_schema('tweet')
    end

    it "should return 200 status for creating a bookmark for a tweet with /tweets/:id/bookmark" do 
      post "/tweets/#{tweet.id}/bookmark"
      expect(response).to have_http_status(200)
    end

    it "should return match the JSON schema for a tweet with /tweets/:id/bookmark" do 
      post "/tweets/#{tweet.id}/bookmark"
      expect(response).to response_schema('tweet')
    end

    it "should return 200 status for creating a bookmark for a tweet with /tweets/:id/stats" do 
      get "/tweets/#{tweet.id}/stats"
      expect(response).to have_http_status(200)
    end

    it "should return match the JSON schema for a tweet with /tweets/:id/stats" do 
      get "/tweets/#{tweet.id}/stats"
      expect(response).to response_schema('tweet')
    end

 
  end
end
