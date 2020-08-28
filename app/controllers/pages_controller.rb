class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  before_action :profile_show_page?, only: [:user_profile_overview, :user_profile_followers, :user_profile_following]

  def home
    @landing_page_navbar = true
  end

  def user_profile_overview
  end

  def user_profile_followers
  end

  def user_profile_following
  end

  private

  def profile_show_page?
    @user = User.find(params[:id])
    @profile_show_page = true
  end

end
