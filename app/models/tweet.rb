class Tweet < ApplicationRecord
    belongs_to :User, class_name: "User", foreign_key: "User_id"
    
end
