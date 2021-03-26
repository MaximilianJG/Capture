class RemoveLikesCountFromComments < ActiveRecord::Migration[6.0]
  def change
    def self.up
      remove_column :table_name, :column_name
    end
  end
end
