class Comment < ApplicationRecord
  belongs_to :quote
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :comment_votes, dependent: :destroy


  validates :content, presence: true

  def comment_votes_aggregate
    value = 0
    if self.comment_votes
      self.comment_votes.each do |comment_vote|
        value = 0
        value += comment_vote.value
      end
    end
    return value
  end
end
