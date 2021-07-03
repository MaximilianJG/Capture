class NotificationsController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @notifications = policy_scope(Notification).where(recipient: current_user).newest_first
    #@notification = current_user.notifications
  end
end
