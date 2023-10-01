FactoryBot.define do
  factory :hashtag_tweet do
    hashtag { association :hashtag }
    tweet { association :tweet }
  end
end
