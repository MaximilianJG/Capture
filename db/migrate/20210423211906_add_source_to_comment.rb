class AddSourceToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :source, :string
  end
end
