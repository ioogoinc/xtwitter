class Bookmark < ApplicationRecord
    belongs_to :author, class_name: Authors, foreign_key: :author_id
    belongs_to :tweet, class_name: Tweet, foreign_key: :tweet_id

end
