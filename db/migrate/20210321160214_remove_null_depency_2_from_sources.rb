class RemoveNullDepency2FromSources < ActiveRecord::Migration[6.0]
  def change
    remove_reference :sources, :folder, index: true, foreign_key: true
  end
end
