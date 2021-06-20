class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :suggested_for_your, :default_profile_image

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :email, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :email, :photo])
  end

  # Pundit: white-list approach.

  # This is a method so that we can change default profile image in one place rather than having to do it everywhere it's rendered
  def default_profile_image
    return @default_profile_image = "Profile_avatar_placeholder_large_t0udob"
  end

  def suggested_for_your # Users that are not current_user && not current_user.following
    if user_signed_in?
      @users = User.where.not(id: current_user.id)

      @suggested_users = []
      @users.each do |user|
        unless current_user.following.include? user
          @suggested_users << user
        end
      end
      @suggested_users = @suggested_users.sort! { |a, b|  b.created_at <=> a.created_at }
    end
  end

  def most_saved_sources
    source_url_count = Hash.new(0)
    Source.all.each { |source| source_url_count[source.url_of_website] += 1}
    source_url_count = source_url_count.sort_by{|source,number| number}
    return source_url_count.last(3).map {|source_url| Source.find_by(url_of_website: source_url)}
  end

  def sort_by_upvotes
    raise
    self.sort_by do |comment|
      comment.comment_votes_count
    end
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
