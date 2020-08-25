class SourcesController < ApplicationController

  def index
    @sources = Source.all
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

end
