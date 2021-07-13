class AddPrivateModeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :private_mode, :boolean,  default: false
  end
end
