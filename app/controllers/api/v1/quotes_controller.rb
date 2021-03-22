class Api::V1::QuotesController < Api::V1::BaseController

  def create
    current_user = User.find(snippet_post_request_params[:user_id])
    @quote = Quote.new(content: snippet_post_request_params[:quote_content], url_of_quote: general_post_request_params[:url_of_quote])
    @quote.user = current_user
    authorize @quote
    @source = Source.where(user: current_user).find { |source| source.url_of_website == @quote.url_of_quote }
    @quote.source = @source
    @quote.save!
    render :show
  end

  def snippet_post_request_params
    params.require(:snippet_post_request).permit(:user_id, :quote_content, :url_of_quote)
  end

  def render_error
    render json: { errors: @source.errors.full_messages },
      status: :unprocessable_entity
  end
end
