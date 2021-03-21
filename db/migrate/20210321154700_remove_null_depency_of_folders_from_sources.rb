class RemoveNullDepencyOfFoldersFromSources < ActiveRecord::Migration[6.0]
  def self.down
      remove_column :sources, :folder_id
  end
end
