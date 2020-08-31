class Api::V1::QuotesController < Api::V1::BaseController


  # def index
  #   @sources = policy_scope(Source)
  # end

  def create
    @quote = Quote.new(api_quote_params)
    @quote.user = User.last # Solved when implementing authentication
    authorize @quote

    @source = Source.all.find { |source| source.url_of_website == @quote.url_of_quote } # refactor line 11

    if @source
      @quote.source_id = @source.id
    else
      @source = Source.new(api_source_params)
      @source.folder = User.third.folders.first # When pushing to heroku change the Users
      @source.user = User.third # authentication
      @source.save!
      @quote.source = @source
    end

      @quote.save!
      render :show

    end


  def api_quote_params
    params.require(:quote).permit(:content, :url_of_quote) # how do we get a photo?
  end

  def api_source_params
    params.permit(:title, :website, :date_of_article, :url_of_website)
  end


end
