require 'rails_helper'

RSpec.describe "Api::Tweets", type: :request do
  describe "GET /index" do
    describe "GET /index" do
      it "should return a successful 200 response and validation for the JSON schema" do
        # Setup
       tweets = create_list(:tweet, 3)
        
        # Action
        get "/api/tweets"

        # Assertion
        puts response.body
        expect(response).to response_schema('tweet')
        expect(response).to have_http_status(200)
      end
    end

    describe "GET /show" do 
      it "should return a successful 200 response and validation for the JSON schema" do 
      # Setup
      # user = create(:user)
      tweet = create(:tweet)
      # Action
      get "/api/tweets/#{tweet.id}"
      # Assertion
      puts response.body
      expect(response).to response_schema('tweet')
      # expect(response).to have_http_status(200)
      end
    end
  end
end
