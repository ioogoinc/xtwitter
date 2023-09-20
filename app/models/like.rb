class Like < ApplicationRecord
    belongs_to :liking, class_name: 'User'
    belongs_to :followee, class_name: 'User'
end
