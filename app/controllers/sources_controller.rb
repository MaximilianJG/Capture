class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  # READ
  def index
    # only show sources that the user has created himself (e.g. record.user == user)
    if params[:query].present?
      # @sources = policy_scope(Source).where(user: current_user)
      @sources = policy_scope(Source).search_for_all(params[:query]).where(user: current_user)
    else
      @sources = policy_scope(Source).where(user: current_user)
    end
  end

  def show
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
      $quote.source_id = @source.id
      $quote.save!
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @source.update(strong_source_params)
      redirect_to sources_path(@source)
    else
      render :update
    end
  end

  def destroy
    @source.destroy
    redirect_to sources_path
  end

  private

  def strong_source_params
    params.require(:source).permit(:title, :website, :date_of_article, :date_time_of_save, :url_of_website, :folder_id)
  end

  def set_source
    @source = Source.find(params[:id])
    authorize @source
  end
end
