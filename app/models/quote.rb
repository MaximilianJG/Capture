class Quote < ApplicationRecord
  belongs_to :source
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :content, presence: true
  validates :url_of_quote, presence: true
end
