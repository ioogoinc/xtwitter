FactoryBot.define do
  factory :follow do
    follower { association :user}
    followee { association :user}
  end
end
