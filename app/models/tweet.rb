class Tweet < ApplicationRecord
  has_and_belongs_to_many :hastags
  belongs_to :author, class_name: Author, foreign_key: :author_id

end
