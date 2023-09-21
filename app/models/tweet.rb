class Tweet < ApplicationRecord
  has_and_belongs_to_many :hastags
  belongs_to :author, class_name: 'Author', foreign_key: :author_id

  validates :body, presence: true, length: {maximum: 255}, if: :not_retweet
  validates :body, presence: false, if: !:not_retweet
  def not_retweet
    type != "retweet"
  end

end
