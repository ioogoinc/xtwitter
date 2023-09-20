class Follow < ApplicationRecord
    belongs_to :followers, class_name: user
    belongs_to :followees, class_name: user
end
