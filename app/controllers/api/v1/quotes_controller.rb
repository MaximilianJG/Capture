class Api::V1::QuotesController < Api::V1::BaseController


  # def index
  #   @sources = policy_scope(Source)
  # end

  def create
    @quote = Quote.new(api_quote_params)
    @quote.user = current_user
    # @quote.user = User.first # Solved when implementing authentication
    authorize @quote

    @source = Source.where(user: current_user).find { |source| source.url_of_website == @quote.url_of_quote } # refactor line 11

    if @source
      @quote.source_id = @source.id
    else
      @source = Source.new(api_source_params)

      # @source.folder = User.second.folders.first # When pushing to heroku change the Users
      # @source.user = User.second # authentication

      # @source.folder = User.find(session[:user_id]).folders.first
      # @source.user = User.find(session[:user_id])
raise

      @source.folder = current_user.folders.first
      @source.user = current_user

      @source.date_of_article = "2.Sep.2020"
      @source.save!
      @quote.source = @source
    end

    # if @quote.save!
    #   render :show
    # else
    #   render_error
    # end
      @quote.save!
      render :show

    end


  def api_quote_params
    params.require(:quote).permit(:content, :url_of_quote) # how do we get a photo?
  end #

  def api_source_params
    params.require(:source).permit(:title, :website, :date_of_article, :url_of_website)
  end

  def render_error
    render json: { errors: @restaurant.errors.full_messages },
      status: :unprocessable_entity
  end
end
