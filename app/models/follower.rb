class Follower < ApplicationRecord
    belongs_to :author, class_name: Authors, foreign_key: :author_id
end
