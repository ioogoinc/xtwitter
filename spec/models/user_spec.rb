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

  # describe "scopes" do

  #   context "count followers" do
  #       let!(:user1) { FactoryBot.create(:user)}
  #       let!(:user1) { FactoryBot.create(:user)}
  #       let!(:follower1) { FactoryBot.create(:user)}
  #       let!(:follower2) { FactoryBot.create(:user)}

  #     before do
  #       user1.followers << follower1
  #       user1.followers << follower2
  #       user2.followers << follower1
  #     end
  #    it "followers_count_by_user" do
  #       expect(User.followers_count_by_user(user1.id)).to eq(2)
  #       expect(User.followers_count_by_user(user2.id)).to eq(1)
  #    end
  #   end

   

  # end


    # it "has many tweets" do
    #   user   = FactoryBot.create(:user)
    #   tweet1 = FactoryBot.create(:tweet, user:user)
    #   tweet2 = FactoryBot.create(:tweet, user:user)
    #   expect(user.tweets).to include(tweet1, tweet2)
    # end 

  
end
