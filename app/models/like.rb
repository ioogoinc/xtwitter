class Like < ApplicationRecord
    has_one :author, class_name: Authors, foreign_key: :author_id
    has_one :tweet, class_name: Tweet, foreign_key: :tweet_id

end
