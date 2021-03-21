class AddFolderReferenceToSources < ActiveRecord::Migration[6.0]
  def change
    add_reference :sources, :folder, foreign_key: true
  end
end
