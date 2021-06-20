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
    @notification = params[:record].to_notification
    @comment = params[:comment]
    @recipient = params[:recipient]

    mail(to: @recipient.email, subject: @notification.message)
  end
end
