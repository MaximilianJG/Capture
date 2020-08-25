class SourcesController < ApplicationController
  before_action :set_source, only: [:show]

  # READ
  def index
    # only show sources that the user has created himself (e.g. record.user == user)
    @sources = policy_scope(Source).where(user: current_user)
  end

  def show
  end

  def new
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(strong_source_params)
    @source.user = current_user

    if @source.save!
      redirect_to sources_path
      # not for Chrome Extension
      $quote.source_id = @source.id
      $quote.save!
    else
      render :new
    end
  end

  def strong_source_params
    params.require(:source).permit(:title, :website, :date_of_article, :date_time_of_save, :url_of_website, :folder_id)
  end

  private

  def set_source
    @source = Source.find(params[:id])
    authorize @source
  end
end
