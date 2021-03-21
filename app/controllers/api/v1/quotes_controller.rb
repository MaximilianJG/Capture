class Api::V1::QuotesController < Api::V1::BaseController

require "open-uri"
  def create
    current_user = User.find(general_post_request_params[:user_id])
    @quote = Quote.new(content: general_post_request_params[:quote_content], url_of_quote: general_post_request_params[:url_of_quote])
    @quote.user = current_user
    authorize @quote
    @source = Source.where(user: current_user).find { |source| source.url_of_website == @quote.url_of_quote } # refactor line 11

    if @source
      @quote.source_id = @source.id
      @quote.save!
    else
      @source = Source.new(title: general_post_request_params[:source_title], website: general_post_request_params[:website], url_of_website: general_post_request_params[:url_of_website])
      @source.user = current_user

      file = URI.open(general_post_request_params[:source_photo_url])
      @source.photo.attach(io: file, filename: 'test.jpg', content_type: 'image/jpg')
      @source.save!
      @quote.source = @source
      @quote.save!
    end
      @quote.save!
      render :show
  end


  def general_post_request_params
    params.require(:general_post_request).permit(:user_id, :quote_content, :url_of_quote, :source_title, :website, :url_of_website, :source_photo_url)
  end

  def render_error
    render json: { errors: @source.errors.full_messages },
      status: :unprocessable_entity
  end
end
