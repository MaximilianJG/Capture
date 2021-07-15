class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  before_action :profile_show_page?, only: [:user_profile_overview, :user_profile_followers, :user_profile_following]

  def home
    @landing_page_navbar = true

    @sources = Source.all.order(created_at: :desc).limit(9)
    # most_saved_sources # Application Controller method
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
    @heading = "Top Results"
  end

  def user_profile_overview
    @public_folders = Folder.where(user_id: params[:id])
    @user = User.find(params[:id])
    # @public_folders.sort_by{|folder| folder.sources.count} ## public folders has to be sorted by amount of sources in each folder. (only folders with most sources should show.)

    @recent_activity = []
    if @user == current_user
      @sources = Source.sources_ordered_for_profile_overview(@user).limit(10)
    else
      @sources = @sources.where(private: false)
    end


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

  def get_sources_for_profile_overview
    @user = User.find(params[:id].to_i)
    @new_comment = Comment.new
    @no_right_column = true

    @current_page = params[:page].to_i
    @sources_per_page = 10

    @sources = Source.sources_ordered_for_profile_overview(@user).
    offset((@current_page - 1) * @sources_per_page).
    limit(@sources_per_page)

    render :layout => false
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

  def all_user_suggestions
    @heading = "All User Suggestions"
    @users = suggested_for_your
  end

  def about_us
    @landing_page_navbar = true
  end

  private

  def profile_show_page?
    @user = User.find(params[:id])

    @profile_show_page = true
    @heading = "#{User.find(params[:id]).username}"
  end

end
