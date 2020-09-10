class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  # READ
  def index
    if params[:query].present?
      # @sources = policy_scope(Source).where(user: current_user)
      @sources = policy_scope(Source).search_for_all(params[:query]).where(user: current_user)
    else
      @sources = policy_scope(Source).where(user: current_user)
    end
    @sources = @sources.order(created_at: :desc)
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
      $quote.user_id = current_user.id
      $quote.source_id = @source.id
      $quote.save!
    else
      render :new
    end
  end

  def edit
  end

  def update
    @source = Source.find(params[:id])
    if @source.update(strong_source_params)
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

  private

  def strong_source_params
    params.require(:source).permit(:title, :website, :date_of_article, :url_of_website, :folder_id, :photo)
  end

  def set_source
    @source = Source.find(params[:id])
    authorize @source
  end
end
