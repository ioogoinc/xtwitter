require 'rails_helper'

RSpec.describe 'Request test', type: :request do
    
=begin context 'Checking status code' do
        it 'Return something' do
            get 
        end    
    end 
=end

context 'Check the tweet validations' do
  
tweet_params = {content: 'Tweet test', user_id: 2}

  it 'should return 200 status response for PUT /tweets/:id' do
    put '/tweets/1', :params => tweet_params
    expect(response.status).to have_http_status(200)
  end
=begin
  it 'PUT should return a Tweet model that matches JSON schema' do
    put '/tweets/1', :params => put_request_params
    expect(response).to match_response_schema('tweet')
  end
=end
end

end

=begin
    
RSpec.describe "Tweets", type: :request do
  describe "POST /tweets" do
    context "with valid parameters" do
      let(:valid_params) { { content: "This is a test tweet" } }

      it "creates a new tweet" do
        expect {
          post tweets_path, params: { tweet: valid_params }
        }.to change(Tweet, :count).by(1)

        expect(response).to have_http_status(201) # 201 Created
      end
    end

    context "with invalid parameters" do
      let(:invalid_params) { { content: "" } }

      it "does not create a new tweet" do
        expect {
          post tweets_path, params: { tweet: invalid_params }
        }.not_to change(Tweet, :count)

        expect(response).to have_http_status(422) # 422 Unprocessable Entity (due to validation error)
      end
    end
  end
end
    
=end
=begin 
context "with valid parameters" do
  let(:valid_params) { { content: "This is a test tweet" } }

  it "creates a new tweet" do
    expect {
      post tweets_path, params: { tweet: valid_params }
    }.to change(Tweet, :count).by(1)

    expect(response).to have_http_status(201) # 201 Created
  end
end
=end