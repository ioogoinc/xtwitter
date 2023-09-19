class Tweet < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :hastags

end
