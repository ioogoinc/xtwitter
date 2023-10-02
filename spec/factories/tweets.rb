FactoryBot.define do
  factory :tweet do
    user { nil }
    body { "MyText" }
    type { "" }
    parent_tweet { nil }
  end
end
