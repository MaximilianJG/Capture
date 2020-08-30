class AddUserToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :quotes, :user, null: false, foreign_key: true
  end
end
