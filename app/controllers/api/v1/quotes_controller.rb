class Api::V1::QuotesController < Api::V1::BaseController

  # def index
  #   @sources = policy_scope(Source)
  # end

  def create
    current_user = User.find(api_user_params[:user_id])

    @quote = Quote.new(api_quote_params)
    @quote.user = current_user
    authorize @quote

    @source = Source.where(user: current_user).find { |source| source.url_of_website == @quote.url_of_quote } # refactor line 11

    if @source
      @quote.source_id = @source.id
    else
      @source = Source.new(api_source_params)

      @source.folder = current_user.folders.first
      @source.user = current_user

      @source.date_of_article = "2.Sep.2020"
      @source.save!
      @quote.source = @source
    end

      @quote.save!
      render :show

    end


  def api_quote_params
    params.require(:quote).permit(:content, :url_of_quote) # how do we get a photo?
  end #

  def api_source_params
    params.require(:source).permit(:title, :website, :date_of_article, :url_of_website)
  end

  def api_user_params
    params.require(:user).permit(:user_id)
  end

  def render_error
    render json: { errors: @source.errors.full_messages },
      status: :unprocessable_entity
  end
end
