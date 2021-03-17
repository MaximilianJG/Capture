class AddSourceTagToSource < ActiveRecord::Migration[6.0]
  def change
    add_reference :sources, :source_tag, foreign_key: true
  end
end
