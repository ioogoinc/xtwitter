class Hashtag < ApplicationRecord
    validates :hashtag_body, presence: { message: "must be given please" }
end
