# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  skip_before_action :verify_authenticity_token, only: [:enter_private_mode]


  after_action :welcome_email, only: [:create]
  after_action :capture_reminder, only: [:create] #-- uncomment when everything is working
  # this is working in development but might not work in product yet
  # just a heads up!

  # GET /resource/sign_up
  def new
    @outside_app = true
    sign_up_tags
    super
  end

  # POST /resource
  def create
    super
    cookies[:capture_user_id] = current_user.id

    # User taghs
    # tags = []
    # params[:user][:tags].each do |tag_id|
    #   unless tag_id == ""
    #     @user.tags << Tag.find(tag_id)
    #   end
    # end
  end

  def enter_private_mode
    if current_user.private_mode == true
      current_user.update!(private_mode: false)
    else
      current_user.update!(private_mode: true)
    end
    redirect_back(fallback_location: root_path)
  end

  def welcome_email
    UserMailer.with(user: @user).welcome_email.deliver
  end

  def capture_reminder
    GetChromeExtensionReminderJob.set(wait: 1.minute).perform_later(@user)
    #https://guides.rubyonrails.org/active_job_basics.html
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def sign_up_tags
    tag_names = ["economics", "politics", "corona", "tech", "finance", "venture", "breaking_news"]

    @sign_up_tags = []
    tag_names.each do |tag_name|
      if Tag.find_by(name: tag_name)
        @sign_up_tags << Tag.find_by(name: tag_name)
      else
        @sign_up_tags << Tag.create!(name: tag_name)
      end
    end
    @sign_up_tags
  end
end
