class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  # AKA My captures
  def index
    @heading = "My Captures"
    @no_right_column = true
    @sources = policy_scope(Source).where(folder: nil, user: current_user)

    # if params[:index_filter_query].present?
    #   @sources = policy_scope(Source).filter_sources_with_quotes(params[:index_filter_query]).where(user: current_user)
    # else
    #   @sources = policy_scope(Source).where(user: current_user)
    # end

    @sources = @sources.order(created_at: :desc)

    @folders = Folder.where(user: current_user)
  end

  def show
    @source_page = true

    @all_comments = []
    @source.quotes.each do |quote|
      quote.comments.each do |comment|
        @all_comments << comment
      end
    end

    @source_quotes = @source.quotes

    respond_to do |format|
      format.html
      format.json {render json: {source_quotes: @source_quotes }}
    end


  end

  def new
    @source = Source.new
    authorize @source
  end

  def create
    @source = Source.new(strong_source_params)
    @source.user = current_user
    authorize @source

    if @source.save!
      redirect_to sources_path
      # not for Chrome Extension
      $quote.user_id = current_user.id
      $quote.source_id = @source.id
      $quote.save!
    else
      render :new
    end
  end

  def update
    # @source = Source.find(params[:id]) # can't this go away because we have @source ?
    if @source.update!(strong_source_params)
      redirect_back(fallback_location: root_path)
    else
      render :update
      # add alert that it failed
    end
  end

  def destroy
    @source = Source.find(params[:id])
    authorize @source
    @source.destroy!
    redirect_to request.referrer
  end

  def feed
    @new_comment = Comment.new
    @heading = "Friends Feed"
    @no_right_column = true
    @sources = Source.sources_ordered_for_friends_feed(current_user).limit(10)
    authorize @sources
  end

  # Still have to change sources_ordered_for_discover_feed so that it only returns posty
  # by people you are not following already
  def discover
    @new_comment = Comment.new
    @heading = "Discover"
    @no_right_column = true
    @sources = Source.sources_ordered_for_discover_feed(current_user).limit(10)
    authorize @sources
  end

  def automatic_create
    bbc_scraper
  end

  # ON initial load show feed which gives 10 sources (through to friends-feed partial).
  # Then on feed view add button that allows user to get more sources
  # Button leads to get_sources_for_friends_feed controller method, which takes page nr and 
  # updates it on button press. Method finds next 10 sources and has to append them
  # to initial 10 sources loaded in feed view through friends feed. Means that we 
  # have to make get sources a partial as well, that appends onto main feed by using
  # the main feed's id.
  # Need a generic ordering method on sources_ordered_for_feed.

  def get_sources_for_friends_feed
    @new_comment = Comment.new
    @heading = "Friends Feed"
    @no_right_column = true
    @sources = Source.sources_ordered_for_friends_feed(current_user)
    authorize @sources

    @current_page = params[:page].to_i
    @sources_per_page = 10

    @sources = Source.sources_ordered_for_friends_feed(current_user).
    offset((@current_page - 1) * @sources_per_page).
    limit(@sources_per_page)
    authorize @sources 

    render :layout => false
  end

  def get_sources_for_discover_feed
    @new_comment = Comment.new
    @heading = "Friends Feed"
    @no_right_column = true
    @sources = Source.sources_ordered_for_discover_feed(current_user)
    authorize @sources

    @current_page = params[:page].to_i
    @sources_per_page = 10

    @sources = Source.sources_ordered_for_discover_feed(current_user).
    offset((@current_page - 1) * @sources_per_page).
    limit(@sources_per_page)
    authorize @sources 

    render :layout => false
  end

      private

      def strong_source_params
        params.require(:source).permit(:title, :website, :date_of_article, :url_of_website, :folder_id, :photo)
      end
    
      def set_source
        @source = Source.find(params[:id])
        authorize @source
      end    
  end
