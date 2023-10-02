require 'rails_helper'

RSpec.describe "tweets/edit", type: :view do
  let(:tweet) {
    Tweet.create!(
      user: nil,
      body: "MyText",
      type: "",
      parent_tweet: nil
    )
  }

  before(:each) do
    assign(:tweet, tweet)
  end

  it "renders the edit tweet form" do
    render

    assert_select "form[action=?][method=?]", tweet_path(tweet), "post" do

      assert_select "input[name=?]", "tweet[user_id]"

      assert_select "textarea[name=?]", "tweet[body]"

      assert_select "input[name=?]", "tweet[type]"

      assert_select "input[name=?]", "tweet[parent_tweet_id]"
    end
  end
end
