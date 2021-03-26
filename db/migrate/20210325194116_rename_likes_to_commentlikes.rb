class RenameLikesToCommentlikes < ActiveRecord::Migration[6.0]
  def change
    def self.up
      rename_table :likes, :comment_likes
    end
  
    def self.down
      rename_table :comment_likes, :likes
    end
  end
end
