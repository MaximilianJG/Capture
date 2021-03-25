class Comment < ApplicationRecord
  belongs_to :quote
  belongs_to :user
  has_many :comments

  validates :content, presence: true
end
