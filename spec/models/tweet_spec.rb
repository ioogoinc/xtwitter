require 'rails_helper'

RSpec.describe Tweet, type: :model do
   
    context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:retweets) }
    it { should have_many(:quotes) }
    it { should have_many(:replies) }
    it { should have_many(:bookmarks) }
    it { should have_many(:likes) }
    
    end
  
  
    context "validations" do
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_most(255) }
    end
    
end
