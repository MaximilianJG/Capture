class AddPrivateToSource < ActiveRecord::Migration[6.0]
  def change
    add_column :sources, :private, :boolean,  default: false
  end
end
