class Api::V1::SourcesController < Api::V1::BaseController
  require "open-uri"

  def create
    current_user = User.find(general_post_request_params[:user_id])
    @quote = Quote.new(content: general_post_request_params[:quote_content], url_of_quote: general_post_request_params[:url_of_quote])
    @quote.user = current_user
    authorize @quote

    @source = Source.new(title: general_post_request_params[:source_title], website: general_post_request_params[:website], url_of_website: general_post_request_params[:url_of_website])

    @source.user = current_user
    file = URI.open(general_post_request_params[:source_photo_url])
    @source.photo.attach(io: file, filename: 'image.jpg', content_type: 'image/jpg')
    @source.save!

    @quote.source = @source

    @quote.save!
    render :show
  end

  def update
    @source = Source.find(params[:id])
    authorize @source
    @source.tags.delete_all

    @tags = []
    tag_post_request_params[:tags].each do |tag|
      @tag = Tag.where(name: tag)
      if @tag = []
        @tag = Tag.new(name: tag)
        @tag.save!
        @tags << tag
      else
        @tags << @tag
      end
    end

    tag_post_request_params[:tags].each do |tag|
      source.tags << tag
    end

    render :show
  end

  private

  def general_post_request_params
    params.require(:general_post_request).permit(:user_id, :quote_content, :url_of_quote, :source_title, :website, :url_of_website, :source_photo_url)
  end

  def tag_post_request_params
    params.require(:tag_post_request).permit(:source_id, :tags)
  end

  def render_error
    render json: { errors: @source.errors.full_messages },
      status: :unprocessable_entity
  end
end
