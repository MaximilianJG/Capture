class Quote < ApplicationRecord
  belongs_to :source
  belongs_to :user
  has_many :comments

  validates :content, presence: true
  validates :url_of_quote, presence: true
end
