class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  before_action :profile_show_page?, only: [:user_profile_overview, :user_profile_followers, :user_profile_following]

  def home
    @landing_page_navbar = true
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
    @no_right_column = true
    @public_folders = Folder.where(user_id: params[:id])
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
