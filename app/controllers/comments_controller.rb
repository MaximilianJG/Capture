class CommentsController < ApplicationController

  def create

    @source = Source.find(params[:source_id])
    @quote = @source.quotes.first

    # @quote = Quote.find(params[:quote_id])

    @comment = Comment.new(content: params[:content]) # how do I build this with strong_comment_params
    authorize @comment

    @comment.quote = @quote
    @comment.user = current_user

    if @comment.save
      redirect_back(fallback_location: root_path)
      else
      redirect_back(fallback_location: root_path)
    end
  end

  def strong_comment_params
    params.require(:comment).permit(:content)
  end

end
