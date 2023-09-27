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

        it "returns the count of retweets for a user" do
            user = create(:user)
            create_list(:tweet, 3, user: user, retweet_id: 1)
            create(:tweet, user: user)
            retweets_count = Tweet.retweets_count(user.id)

            expect(retweets_count).to eq(3)
        end

        it "returns the count of quotes for a user" do
            user = create(:user)
            create_list(:tweet, 3, user: user, quote_id: 1)
            create(:tweet, user: user)
            quotes_count = Tweet.quotes_count(user.id)
            expect(quotes_count).to eq(3)
        end
        it "returns the tweets bookmarked by a user" do
            user = create(:user)
            create_list(:tweet, 3)
            bookmarked_tweets = create_list(:tweet, 2)
            bookmarked_tweets.each do |tweet|
              create(:bookmark, user: user, tweet: tweet)
            end
            bookmarked_tweets_found = Tweet.bookmarks_tweet_by_user(user.id)
            expect(bookmarked_tweets_found).to match_array(bookmarked_tweets)
    
        end 

        # it "creates a new retweet" do
        #     user = create(:user)
        #     tweet_to_retweet = create(:tweet)
        #     retweet = Tweet.create_retweet(user, tweet_to_retweet)
        #     expect(retweet).to be_a(Tweet)
        #     expect(retweet.body).to be_nil
        #     expect(retweet.user_id).to eq(user.id)
        #     expect(retweet.retweet_id).to eq(tweet_to_retweet.id)
      
        # end

        # it "creates a new quote" do 
        #     user = create(:user)
        #     new_body = 'Quote body'
        #     quote = Tweet.create_quote(user, new_body)
        #     expect(quote).to be_a(Tweet)
        #     expect(quote.body).to eq(new_body)
        #     expect(quote.user_id).to eq(user.id)
        #     expect(quote.quote_id).to eq(quote.id)      
        # end
        
    end
end
