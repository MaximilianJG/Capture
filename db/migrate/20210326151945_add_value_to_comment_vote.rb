class AddValueToCommentVote < ActiveRecord::Migration[6.0]
  def change
    add_column :comment_votes, :value, :integer
  end
end
