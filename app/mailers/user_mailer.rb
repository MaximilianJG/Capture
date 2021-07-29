class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.newsletter_mailer.subject
  #
  def newsletter_mailer
    @newsletter = Newsletter.all
    emails = @newsletter.collect(&:email).join(", ")
    mail(to: emails, subject: "Hi, this is a test mail.")
  end

  def notification_mailer
    @notification = params[:record]
    @comment = params[:comment]
    @recipient = params[:recipient]
    mail(to: @recipient.email, subject: @notification.to_notification.message)

    # @notification =Notification.first
    # @comment = Comment.last
    # @recipient = User.third

    # if @comment.user.photo.attached?
    #   attachments.inline["avatar.jpg"] = @comment.user.photo.key
    # # else
    # #   attachments["avatar"]
    # end

    mail(to: @recipient.email, subject: @notification.to_notification.message)
  end

  def get_chrome_extension_reminder
    @user = params[:user]
    mail(to: @user.email, subject: "Don't forget to download the Chrome Extension")
  end

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to Capture #{@user.username}")
  end
end
