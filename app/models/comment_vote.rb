class CommentVote < ApplicationRecord
  belongs_to :user
  belongs_to :comment, counter_cache: true

  def upvote
    if self.value == 0 ||  self.value == -1
      self.value += 1
      self.save!
    else
      self.value
    end
  end

  def downvote
    if self.value == 0 ||  self.value == 1
      self.value -= 1
      self.save!
    else
      self.value
    end
  end
end
