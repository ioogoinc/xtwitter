FactoryBot.define do
  factory :reply do
    body { Faker::Lorem.paragraph }
    user { association :user }
    tweet { association :tweet}
  end
end
