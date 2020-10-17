class ContactsController < ApplicationController

  def create
    @contact = Contact.new(strong_contact_params)

    authorize @contact
    if @contact.save
      ContactMailer.general_message(@contact).deliver_now
      redirect_to root_path, notice: "Your application has been received"
    else
      redirect_to root_path, alert: "#{@contact.errors.messages[:email][0]}"
    end
  end

  private

  def strong_contact_params
    params.require(:contact).permit(:email)
  end
end
