class Quote < ApplicationRecord
  belongs_to :source

  validates :content, presence: true
end
