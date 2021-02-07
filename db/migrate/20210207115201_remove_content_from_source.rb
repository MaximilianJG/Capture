class RemoveContentFromSource < ActiveRecord::Migration[6.0]
  def change
    remove_column :sources, :content
  end
end
