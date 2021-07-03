class GetChromeExtensionReminderJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.with(user: user).get_chrome_extension_reminder.deliver
  end
end
