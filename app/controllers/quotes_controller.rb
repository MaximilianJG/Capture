class QuotesController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create, :create_quote_within_app]


  def show
    @quote = Quote.find(params[:id])
    authorize @quote
  end

  def new
    @quote = Quote.new
    authorize @quote
  end

  def create
    @quote = Quote.new(content: post_quote_params[:content], source_id: post_source_params[:id], user_id: post_user_params[:user_id])
    authorize @quote
    @quote.save

    if !post_comment_params[:content].nil?
      @comment = Comment.new(content: post_comment_params[:content], user_id: post_user_params[:user_id])
      @comment.quote = @quote
      authorize @comment
      @comment.save!
    end
  end

  def post_quote_params
    params.require(:quote).permit(:content)
  end #

  def post_source_params
    params.require(:source).permit(:id)
  end

    def post_user_params
    params.require(:user).permit(:user_id)
  end

  def post_comment_params
    params.require(:comment).permit(:content)
  end

  def strong_quote_params
    params.require(:quote).permit(:content, :url_of_quote, :source_id)
  end
end
