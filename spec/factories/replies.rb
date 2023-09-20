FactoryBot.define do
  factory :reply do
    body { "MyString" }
    user { nil }
    tweet { nil }
  end
end
