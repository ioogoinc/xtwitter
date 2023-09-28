require 'rails_helper'

RSpec.describe "Users", type: :routing do
  describe "Route that show users tweets and replies" do
    it "Route to /users/:id/tweets using GET to UsersController" do
      expect(get('/users/:id/tweets')).to route_to('users#show')
    end
  end
end
