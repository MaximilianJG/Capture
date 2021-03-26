class Comment < ApplicationRecord
  belongs_to :quote
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :comment_votes, dependent: :destroy


  validates :content, presence: true
end
