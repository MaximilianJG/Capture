class AddVotesCountToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :comment_votes_count, :integer, :default => 0
  end
end
