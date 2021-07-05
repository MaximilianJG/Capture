# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)
# CommentNotification.with(comment: Comment.first).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  deliver_by :email, mailer: "UserMailer", method: :notification_mailer, if: :email_notifications?
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  def to_database
    {
      type: self.class.name, 
      params: params
    }
  end

  # Add required params
  param :comment

  # Define helper methods to make rendering easier.

  def email_notifications?
    if recipient
      recipient.email_notifications?
    else
      true
    end
  end


  def message
    "#{params[:comment].user.username} has commented on your capture"
  end

  def url()
    comment_path(params[:comment])
  end
end
