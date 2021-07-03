# To deliver this notification:
#
# CommentReplyNotification.with(post: @post).deliver_later(current_user)
# CommentReplyNotification.with(post: @post).deliver(current_user)

class CommentReplyNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database, format: :to_database
  deliver_by :email, mailer: "UserMailer", method: :notification_mailer
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :comment

  def to_database
    {
      type: self.class.name,
      params: params
    }
  end

  def message
    "#{params[:comment].user.username} replied to your comment"
  end

  def url()
    comment_path(params[:comment])
  end
end
