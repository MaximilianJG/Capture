class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  # AKA My captures
  def index
    @sources = Source.all
    if params[:index_filter_query].present?
      @sources = policy_scope(Source).filter_sources_with_quotes(params[:index_filter_query]).where(user: current_user)
    else
      @sources = policy_scope(Source).where(user: current_user)
    end
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
    @source.destroy
    redirect_to sources_path
  end


  def feed
    @feed_page = true
    @sources = policy_scope(Source).where(user: current_user.following)
    authorize @sources
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
