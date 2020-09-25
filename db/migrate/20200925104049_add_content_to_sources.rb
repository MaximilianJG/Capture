class AddContentToSources < ActiveRecord::Migration[6.0]
  def change
    add_column :sources, :content, :text
  end
end
