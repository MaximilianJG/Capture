class QuotesController < ApplicationController

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(strong_quote_params)
    @source = Source.all.find { |source| source.url_of_website == @quote.url_of_quote } # chanegs sources.all -> to only sources of current user
    if @source
      @quote.source_id = @source.id
      @quote.save
      redirect_to sources_path
    else
      redirect_to new_source
    end
  end

  def strong_quote_params
    params.require(:quote).permit(:content, :url_of_quote)
  end
end
