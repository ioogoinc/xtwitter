class Follower < ApplicationRecord
    has_one :author, class_name: Authors, foreign_key: :author_id
end
