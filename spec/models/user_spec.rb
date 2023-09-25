require 'rails_helper'

RSpec.describe User, type: :model do

  context "associations" do
    it { should have_many(:tweets) }
    it { should have_many(:followees) }
    it { should have_many(:followers) }
    it { should have_many(:replies) }
    it { should have_many(:likes) }
    it { should have_many(:bookmarks) }
  end

  context "validations" do
    it { should validate_uniqueness_of(:email)}
    it { should validate_uniqueness_of(:username)}
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it do
        should validate_length_of(:password).is_at_least(12).
        on(:user)
    end

  end



    # it "has many tweets" do
    #   user   = FactoryBot.create(:user)
    #   tweet1 = FactoryBot.create(:tweet, user:user)
    #   tweet2 = FactoryBot.create(:tweet, user:user)
    #   expect(user.tweets).to include(tweet1, tweet2)
    # end 

  
end
