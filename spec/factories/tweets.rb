FactoryBot.define do
  factory :tweet do
    association :user
    body { Faker::Lorem.paragraphs }
  end
end
