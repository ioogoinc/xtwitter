FactoryBot.define do
  factory :reply do
    body { Faker::Lorem.paragraph }
    user { Faker::Internet.uuid}
    tweet { Faker::Internet.uuid }
  end
end
