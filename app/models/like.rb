class Like < ApplicationRecord
    belongs_to :author
    belongs_to :tweet

    validates :author_id, uniqueness: {scope: :tweet_id}
    validates_associated :author
    validates_associated :tweet

end
