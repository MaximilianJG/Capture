class QuotesController < ApplicationController

  def show
    @quote = Quote.find(params[:id])
    authorize @quote
  end

  def new
    @quote = Quote.new
    authorize @quote
  end

  def create

      @quote = params[:quote]
      raise

    # When building the chrome extension the $ goes away and use the @ sign. and after the create sources just call create a quote (or keep it the same)
    $quote = Quote.new(strong_quote_params)
    authorize $quote
    @source = Source.all.find { |source| source.url_of_website == $quote.url_of_quote } # changes sources.all -> to only sources of current user
    if @source
      $quote.source_id = @source.id
      $quote.user_id = current_user.id
      $quote.save!
      redirect_to sources_path
    else
      redirect_to new_source_path
    end
  end

  def strong_quote_params
    params.require(:quote).permit(:content, :url_of_quote)
  end
end
