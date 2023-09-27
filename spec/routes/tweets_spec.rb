require 'rails_helper'

RSpec.describe "Tweets", type: :routing do
  describe "GET /tweets/new" do
    it "Route to /tweets/new using GET to ontroller" do
      expect(get:'/tweets/new').to route_to('tweets#new')
    end
    it "Route to /tweets using POST to controller" do
      expect(post:'/tweets').to route_to('tweets#create')
    end
    it "Route to /tweets using PUT/PATCH to controller" do
      expect(put:'/tweets/:id').to route_to('tweets#update')
    end
    it "Route to /tweets using GET to controller" do
      expect(get:'/tweets/:id/edit').to route_to('tweets#edit')
    end
  end
end
