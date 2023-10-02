require 'rails_helper'

RSpec.describe "/tweets API", type: :request do
  describe "tweets" do
  
    let(:user) { create(:user)}
    let(:tweet) { create(:tweet, user: user)}

    describe "create a tweet" do
      it "should return a successful 200 response for /tweets" do
      
        tweet_params = {body: "body", user: tweet.user}
        post '/tweets', params: tweet_params
        
        print response.body

        expect(response).to have_http_status(200)
      end

      # it "should return a validation for the JSON schema" do 
      #   post "/tweets"

      #   expect(response).to response_schema('tweet')
      # end
    end

    describe "update a tweet" do 
      it "should return a successful 200 response for /tweets/:id" do 
        update_tweet_params= {body: "New body"}

        patch "/tweets/#{tweet.id}", params: { tweet: update_tweet_params}
        expect(response).to have_http_status(200)
      end

      it "should return a validation for the JSON schema" do 
        patch "/tweets/#{tweet.id}"
        expect(response).to response_schema('tweet')
      end
    end


    describe "like a tweet" do 
      it "should return a successful 200 response for /tweets/:id/like" do 
        post "/tweets/#{tweet.id}/like"
        expect(response).to have_http_status(200)
      end

      it "should return a validation for the JSON schema" do 
        post "/tweets/#{tweet.id}/like"
        expect(response).to response_schema('tweet')
      end
    end

    describe "unlike a tweet" do 

      it "should return a successful 200 response for /tweets/:id/unlike" do 
            delete "/tweets/#{tweet.id}/unlike"
            expect(response).to have_http_status(200)
      end

      it "should return a validation for the JSON schema" do 
        delete "/tweets/#{tweet.id}/unlike"
        expect(response).to response_schema('tweet')
      end

    end

    describe "retweet a tweet" do 


      it "should return a successful 200 response for /tweets/:id/retweet" do 
        post "/tweets/#{tweet.id}/retweet"
        expect(response).to have_http_status(200)
      end

      it "should return a validation for the JSON schema" do 
        post "/tweets/#{tweet.id}/retweet"
        expect(response).to response_schema('tweet')
      end
    end


    describe "quote a tweet" do 



      before do 
        post "/tweets/#{tweet.id}/quote", params: {id: tweet.id, body: "This is a quote"}
      end

      it "should return a successful 200 response for /tweets/:id/quote" do 
        
        expect(response).to have_http_status(200)
      end

      it "should return a validation for the JSON schema" do 
        post "/tweets/#{tweet.id}/quote"
        expect(response).to response_schema('tweet')
      end
    end

    describe "reply a tweet" do

 

      before do 
        get "/tweets/#{tweet.id}/reply", params: {id: tweet.id}
      end

      it "should return a successful 200 response for /tweets/:id/reply" do 
            expect(response).to have_http_status(200)
      end

      it "should return a validation for the JSON schema" do 
        get "/tweets/#{tweet.id}/reply"
        expect(response).to response_schema('tweet')
      end

    end


    describe "bookmark a tweet" do


      before do 
        post "/tweets/#{tweet.id}/bookmark", params: {id: tweet.id}
      end

      it "should return a successful 200 response for /tweets/:id/bookmark" do 
          expect(response).to have_http_status(200)
      end
      it "should return a validation for the JSON schema" do 
        post "/tweets/#{tweet.id}/bookmark"
        expect(response).to response_schema('tweet')
      end
    end


    describe "starts for a tweet" do 


      before do 
        get "/tweets/#{tweet.id}/stats", params: {id: tweet.id}
      end
      it "should return a successful 200 response for /tweets/:id/stats" do 
        expect(response).to have_http_status(200)
      end

      it "should return a validation for the JSON schema" do 
        get "/tweets/#{tweet.id}/stats"
        expect(response).to response_schema('tweet')
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
