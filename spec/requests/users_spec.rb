require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do


    it "should return 200 status for retrive all the tweets with /users/:id/tweets" do 
      get "/users/1/tweets"
      expect(response).to have_http_status(200)
  end

    it "hould return match the JSON schema for a tweet with /users/:id/tweets" do
      get "/users/1/tweets"
      expect(response).to response_schema('user')
    end
  end
end
