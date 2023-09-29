require 'rails_helper'

RSpec.describe "/tweets API", type: :request do
  describe "tweets" do
  
    # let(:user) { create(:user)}
    # let(:tweet) { create(:tweet, user: user)}

    describe "create a tweet" do
      it "should return a successful 200 response for /tweets" do
        user= create(:user)
        tweet_params = { body: "this is a tweet", user_id: user.id, 
        retweet_id: 1, quote_id:1, parent_tweet_id:1}
        
        post '/tweets', params: { tweet: tweet_params}
        expect(response).to have_http_status(200)
      end

      # it "should return a validation for the JSON schema" do 
      #   post "/tweets"
      #   expect(response).to response_schema('tweet')
      # end
    end

    describe "update a tweet" do 
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "should return a successful 200 response for /tweets/:id" do 
        update_tweet_params= {body: "New body"}

        patch "/tweets/#{tweet.id}", params: { tweet: update_tweet_params}
        expect(response).to have_http_status(200)
        update_tweet = Tweet.find(tweet.id)
        expect(update_tweet.body).to eq("New body")
      end
    end


    describe "like a tweet" do 
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "should return a successful 200 response for /tweets/:id/like" do 
        post "/tweets/#{tweet.id}/like"
        expect(response).to have_http_status(200)
      end
    end

    describe "unlike a tweet" do 
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "should return a successful 200 response for /tweets/:id/unlike" do 
            delete "/tweets/#{tweet.id}/unlike"
            expect(response).to have_http_status(200)
      end

    end

    describe "retweet a tweet" do 
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      it "should return a successful 200 response for /tweets/:id/retweet" do 
        post "/tweets/#{tweet.id}/retweet"
        expect(response).to have_http_status(200)
      end
    end


    describe "quote a tweet" do 

      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      before do 
        post "/tweets/#{tweet.id}/quote", params: {id: tweet.id, body: "This is a quote"}
      end

      it "should return a successful 200 response for /tweets/:id/quote" do 
        
        expect(response).to have_http_status(200)
      end
    end

    describe "reply a tweet" do

      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      before do 
        get "/tweets/#{tweet.id}/reply", params: {id: tweet.id}
      end

      it "should return a successful 200 response for /tweets/:id/reply" do 
            expect(response).to have_http_status(200)
      end

    end


    describe "bookmark a tweet" do
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      before do 
        post "/tweets/#{tweet.id}/bookmark", params: {id: tweet.id}
      end

      it "should return a successful 200 response for /tweets/:id/bookmark" do 
          expect(response).to have_http_status(200)
      end
    end


    describe "starts for a tweet" do 
      let(:user) { create(:user)}
      let(:tweet) { create(:tweet, user: user)}

      before do 
        get "/tweets/#{tweet.id}/stats", params: {id: tweet.id}
      end
      it "should return a successful 200 response for /tweets/:id/stats" do 
        expect(response).to have_http_status(200)
      end
    end

  #   describe "retweet a tweet" do 
  #     it "should return a successful 200 response for /tweets/:id/retweet" do 
  #       post "/tweets/#{tweet.id}/retweet"
  #       expect(response).to have_http_status(200)
  #     end
  
  #     it "should return a validation for the JSON schema" do 
  #       post "/tweets/#{tweet.id}/retweet"
  #       expect(response).to response_schema('tweet')
  #     end
  #   end

  #   describe "quote a tweet" do 
  #     it "should return a successful 200 response for /tweets/:id/quote" do 
  #       post "/tweets/#{tweet.id}/quote"
  #       expect(response).to have_http_status(200)
  #     end
  
  #     it "should return a validation for the JSON schema" do 
  #       post "/tweets/#{tweet.id}/quote"
  #       expect(response).to response_schema('tweet')
  #     end
  #   end

  #  describe "reply a tweet" do 

  #   it "should return a successful 200 response for /tweets/:id/reply" do 
  #     get "/tweets/#{tweet.id}/reply"
  #     expect(response).to have_http_status(200)
  #   end

  #   it "should return a validation for the JSON schema" do 
  #     get "/tweets/#{tweet.id}/reply"
  #     expect(response).to response_schema('tweet')
  #   end
  #  end

  #  describe "bookmark a tweet" do 
  #   it "should return a successful 200 response for /tweets/:id/bookmark" do 
  #     post "/tweets/#{tweet.id}/bookmark"
  #     expect(response).to have_http_status(200)
  #   end

  #   it "should return a validation for the JSON schema" do 
  #     post "/tweets/#{tweet.id}/bookma before do 
      #   get "/tweets/#{tweet.id}/reply", params: {id: tweet.id}
      # endrk"
  #     expect(response).to response_schema('tweet')
  #   end
  #  end 

  #   describe "starts for a tweet" do 
  #     it "should return a successful 200 response for /tweets/:id/stats" do 
  #       get "/tweets/#{tweet.id}/stats"
  #       expect(response).to have_http_status(200)
  #     end
  
  #     it "should return a validation for the JSON schema" do 
  #       get "/tweets/#{tweet.id}/stats"
  #       expect(response).to response_schema('tweet')
  #     end
  #   end

 
  end
end
