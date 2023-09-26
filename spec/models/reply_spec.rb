require 'rails_helper'

RSpec.describe Reply, type: :model do

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:tweet) }
  end

  context "validations" do
    it { should validate_presence_of(:body)}
    it do
      should validate_length_of(:body).is_at_most(255).
      on(:reply)
    end
  end
end
