require 'rails_helper'

RSpec.describe Tweet, type: :model do
   
    context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:retweets) }
    it { should have_many(:quotes) }
    it { should have_many(:replies) }
    it { should have_many(:bookmarks) }
    it { should have_many(:likes) }
    it { should have_many(:hashtag_tweets)}
    end
  
  
    context "validations" do
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_most(255) }
    end
    
    describe "scopes" do 

        it "tweets_by_user" do
            user  = create(:user)
            tweet1 = create(:tweet, user:user)
            tweet2 = create(:tweet, user:user)
 
            tweets = Tweet.tweets_by_user(user)

            expect(tweets).to include(tweet1, tweet1)
        end

        it "tweets_and_replies_by_user" do
            user  = create(:user)
            tweet1 = create(:tweet, user:user)
            tweet2 = create(:tweet, user:user)
 
            tweets = Tweet.tweets_and_replies_by_user(user)

            expect(tweets).to include(tweet1, tweet1)
        end
        it "retweets_count" do

        end
    end
end
