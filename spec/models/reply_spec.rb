require 'rails_helper'

RSpec.describe Reply, type: :model do
  context 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:tweet) } 
  end
end
