require 'rails_helper'

RSpec.describe "Tweets", type: :routing do
  describe "Routes for the creation of a tweet" do
    it "Route to /tweets/new using GET to TweetsController" do
      expect(get('/tweets/new')).to route_to(:controller => "tweets",
      "action"=>"new")
    end
    it "Route to /tweets using POST to TweetsController" do
      expect(post('/tweets')).to route_to(:controller => "tweets",
      "action"=>"create")
    end
    it "Route to /tweets using PUT/PATCH to TweetsController" do
      expect(put('/tweets/1')).to route_to(:controller => "tweets",
      "action"=>"update", id: "1")
    end
    it "Route to /tweets using GET to TweetsController" do
      expect(get('/tweets/1/edit')).to route_to(:controller => "tweets",
      "action"=>"edit", id: "1")
    end
  end

  describe "Routes for the creation of like, unlike, retweet,quote,reply,bookmark and stats" do 
    it "Route to /tweets/:id/like using POST to TweetsController" do
      expect(post('/tweets/1/like')).to route_to(:controller => "tweets",
      "action"=>"like", id: "1")
    end

    it "Route to /tweets/:id/like using DELETE to TweetsController" do
      expect(delete('/tweets/1/unlike')).to route_to(:controller => "tweets",
      "action"=>"unlike", id: "1")
    end

    it "Route to /tweets/:id/retweet using POST to TweetsController" do
      expect(post('/tweets/1/retweet')).to route_to(:controller => "tweets",
      "action"=>"retweet", id: "1")
    end

    it "Route to /tweets/:id/quote using POST to TweetsController" do
      expect(post('/tweets/1/quote')).to route_to(:controller => "tweets",
      "action"=>"quote", id: "1")
    end

    it "Route to /tweets/:id/reply using GET to TweetsController" do
      expect(get('/tweets/1/reply')).to route_to(:controller => "tweets",
      "action"=>"reply", id: "1")
    end

    it "Route to /tweets/:id/bookmark using POST to TweetsController" do
      expect(post('/tweets/1/bookmark')).to route_to(:controller => "tweets",
      "action"=>"bookmark", id: "1")
    end
    it "Route to /tweets/:id/stats using GET to TweetsController" do
      expect(get('/tweets/1/stats')).to route_to(:controller => "tweets",
      "action"=>"stats", id: "1")
    end
  end
end
