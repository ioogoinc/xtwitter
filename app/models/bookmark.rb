class Bookmark < ApplicationRecord
    bolongs_to :user
    has_one :tweet
end
