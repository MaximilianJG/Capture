# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/newsletter_mailer
  def newsletter_mailer
    UserMailer.newsletter_mailer
  end

  def notification_mailer
    UserMailer.notification_mailer
  end

end
