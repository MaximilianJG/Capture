class Comment < ApplicationRecord
  belongs_to :quote
  belongs_to :user
  has_many :comments, foreign_key: :parent_id, dependent: :destroy
  has_many :comment_votes, dependent: :destroy


  validates :content, presence: true

  # Adds up all the values of all comment votes on a comment. Don't confuse this with comment_votes_count,
  # which returns total nr of comment votes on a comment instead of aggregating their value.
  def comment_votes_aggregate
    if comment_votes
      CommentVote.where(comment_id: self.id).map(&:value).inject(0){|sum,x| sum + x }
    else
      return 0
    end
  end

  # Returns true if liked by user, false if downvoted by user, nil if not liked or disliked by user
  def liked_by_user?(current_user)
    value = CommentVote.where(comment_id: self.id, user_id: current_user.id)&.first&.value
    if value == 1
      return true
    elsif value == -1
      return false
    else
      return nil
    end
  end
end
