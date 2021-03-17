class CreateSourceTags < ActiveRecord::Migration[6.0]
  def change
    create_table :source_tags do |t|
      t.references :source, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
