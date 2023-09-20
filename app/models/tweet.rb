class Tweet < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :hastags
  has_one :author, class_name: Authors, foreign_key: :author_id
end
