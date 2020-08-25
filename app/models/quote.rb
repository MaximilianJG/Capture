class Quote < ApplicationRecord
  belongs_to :source
  has_many :comments

  validates :content, presence: true
  validates :url_of_quote, presence: true
end
