class Quote < ApplicationRecord
  belongs_to :source
  has_many :comments

  validates :content, presence: true

end
