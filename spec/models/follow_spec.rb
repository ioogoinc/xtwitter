require 'rails_helper'

RSpec.describe Follow, type: :model do
  context "association" do
    it { should belong_to(:follower).class_name("User") } 
    it { should belong_to(:followee).class_name("User") } 
  end

  context "validations" do
    it { should validate_uniqueness_of(:follower_id).scoped_to(:followee_id) }
  end
end
