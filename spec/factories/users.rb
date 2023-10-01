FactoryBot.define do
  factory :user do
    name { Faker::Internet.name }
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password( min_length: 12, max_length: 13, mix_case: true, special_characters: true) }
  end
end
