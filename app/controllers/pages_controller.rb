class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  before_action :profile_show_page?, only: [:user_profile_overview, :user_profile_followers, :user_profile_following]

  def home
    @landing_page_navbar = true

    @sources = most_saved_sources # Application Controller method
  end

  def search
    if (params[:global_search_query].present?)
      @results = PgSearch.multisearch(params[:global_search_query])
      @users = []
      @sources = []
      @searched_folders = []
      @results.each do |result|
        if result.searchable_type == "User"
          @users << result.searchable
        elsif result.searchable_type == "Source"
          @sources << result.searchable
        elsif result.searchable_type == "Folder"
          @searched_folders << result.searchable
        end
      end
    else
      @ja = "hello"
    end
  end

  def user_profile_overview
    @public_folders = Folder.where(user_id: params[:id])
    @user = User.find(params[:id])
    # @public_folders.sort_by{|folder| folder.sources.count} ## public folders has to be sorted by amount of sources in each folder. (only folders with most sources should show.)

    @recent_activity = []
    @sources = policy_scope(Source).where(user: params[:id])
    @comments = policy_scope(Comment).where(user: params[:id])

    @sources.each do |source|
      @recent_activity << source
    end

    @comments.each do |comment|
      @recent_activity << comment
    end

    @recent_activity.sort_by{|e| !e[:created_at]}

    @number_of_captures = policy_scope(Quote).where(user: params[:id]).count
    @number_of_comments = policy_scope(Comment).where(user: params[:id]).count
    @number_of_followers = User.find(params[:id]).followers.count
    @number_of_following = User.find(params[:id]).following.count
  end

  def user_profile_followers
    @number_of_captures = policy_scope(Quote).where(user: params[:id]).count
    @number_of_comments = policy_scope(Comment).where(user: params[:id]).count
    @number_of_followers = User.find(params[:id]).followers.count
    @number_of_following = User.find(params[:id]).following.count
  end

  def user_profile_following
    @number_of_captures = policy_scope(Quote).where(user: params[:id]).count
    @number_of_comments = policy_scope(Comment).where(user: params[:id]).count
    @number_of_followers = User.find(params[:id]).followers.count
    @number_of_following = User.find(params[:id]).following.count
  end

  def coming_soon
    @heading = "Coming Soon!"
  end

  private

  def profile_show_page?
    @user = User.find(params[:id])

    @profile_show_page = true
    @heading = "#{User.find(params[:id]).first_name} #{User.find(params[:id]).last_name}"
  end

end
