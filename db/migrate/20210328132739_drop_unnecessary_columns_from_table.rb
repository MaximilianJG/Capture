class DropUnnecessaryColumnsFromTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :comment_likes_count, :boolean
    remove_column :comments, :likes_count, :integer
    remove_column :comments, :votes_count, :integer
  end
end
