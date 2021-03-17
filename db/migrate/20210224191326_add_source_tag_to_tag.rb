class AddSourceTagToTag < ActiveRecord::Migration[6.0]
  def change
    add_reference :tags, :source_tag, foreign_key: true
  end
end
