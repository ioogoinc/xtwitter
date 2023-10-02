require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  context "validations" do
    context "uniqueness" do 
      it "should validate something cool" do
        expect(3).to be 3
      end
      it "should validate something cool 2" do
        expect(3).to be 3
      end
      it "should validate something cool 3" do
        expect(3).to be 3
      end
    end
  end

  describe "methodA" do
    context "When arguments are ok" do
      it "should test happy path" do
        expect(3).to be 2
      end
    end
    context "When arguments are NOT ok" do
      it "should test happy path" do
        expect(3).to be 3
      end
    end
  end
end
