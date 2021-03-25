class AddCommentVotesCountToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :votes_count, :integer, :default => 0
  end
end
