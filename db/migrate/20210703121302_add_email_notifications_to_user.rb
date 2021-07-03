class AddEmailNotificationsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email_notifications, :boolean,  default: true
  end
end
