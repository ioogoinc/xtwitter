require 'rails_helper'

RSpec.describe User, type: :model do

  context "associations" do
    it { should have_many(:tweets) }
    it { should have_many(:followees) }
    it { should have_many(:followers) }
    it { should have_many(:likes) }
    it { should have_many(:bookmarks) }
  end

  context "validations" do
    
      context "username and email uniqueness" do 
        let(:user) { create(:user) }
        subject { user }

        it { should validate_uniqueness_of(:email)}
        it { should validate_uniqueness_of(:username)}
      end

      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:username) }
      it { should validate_presence_of(:password) }
      it do
            should validate_length_of(:password).is_at_least(12).
            on(:user)
          end
  end

  describe "scopes" do

    it "returns the count of followers for a user'" do
      user = create(:user)
      create_list(:user, 3).each do |follower|
        create(:follow, follower: follower, followee: user)
      end
      create(:user)
      followers_count = User.followers_count_by_user(user.id)
      expect(followers_count).to eq(3)
    end
    
    it "returns the count of users being followees by a user'" do 
      user = create(:user)
      create_list(:user, 3).each do |followed_user|
        create(:follow, follower: user, followee: followed_user)
      end
      create(:user)
      following_count = User.following_count_by_user(user.id)
      expect(following_count).to eq(3)

    end
   
  end


    # it "has many tweets" do
    #   user   = FactoryBot.create(:user)
    #   tweet1 = FactoryBot.create(:tweet, user:user)
    #   tweet2 = FactoryBot.create(:tweet, user:user)
    #   expect(user.tweets).to include(tweet1, tweet2)
    # end 

  
end
