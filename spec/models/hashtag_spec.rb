require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  
  describe 'associations' do
    it { should have_and_belong_to_many(:tweets)}
  end

end
