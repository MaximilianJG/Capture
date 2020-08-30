class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|

      t.references :asker, null: false, foreign_key: {to_table: :users}
      t.references :receiver, null: false, foreign_key: {to_table: :users}
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
