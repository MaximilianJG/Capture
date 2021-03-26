class AddDefaultValueToCommentVoteValue < ActiveRecord::Migration[6.0]
  def change
    change_column :comment_votes, :value, :integer, :default => 0
  end
end
