class Hashtag < ApplicationRecord
    validates :hashtag_body, presence: { message: "must be given please" }, length: {within: (1...255)}
end
