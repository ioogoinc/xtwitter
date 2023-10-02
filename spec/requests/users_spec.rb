require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do


    it "should return a successful 200 response for /users/:id/tweets" do 
      get "/users/1/tweets"
      expect(response).to have_http_status(200)
  end

    it "should return a validation for the JSON schema" do
      get "/users/1/tweets"
      expect(response).to response_schema('user')
    end
  end
end
