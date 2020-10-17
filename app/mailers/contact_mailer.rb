class ContactMailer < ApplicationMailer
  default from: "flori.friends.animalhope@gmail.com"

  def general_message(contact)
    @contact = contact
    mail(:to => "flori.friends.animalhope@gmail.com", :subject => "hallo")
  end
end
