class AddUserTagToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :user_tag, foreign_key: true
  end
end
