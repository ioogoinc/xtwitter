require 'rails_helper'

RSpec.describe Follower, type: :model do
  context "association" do
    it { should belong_to(:follower).class_name("User").with_foreign_key(:follower_id) } 
    it { should belong_to(:followee).class_name("User").with_foreign_key(:followee_id) } 
  end

  context "validations" do
    it { should validate_presence_of(:follower_id) }
    it { should validate_presence_of(:followee_id) }
    it { should validate_uniqueness_of(:follower_id).scoped_to(:followee_id) }
  end
end
