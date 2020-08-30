class CommentsController < ApplicationController

  def create
    @quote = Quote.find(params[:quote_id])
    @comment = Comment.new(strong_comment_params)
    authorize @comment

    @comment.quote = @quote
    @comment.user = current_user

    if @comment.save
        redirect_to sources_path
      else
        redirect_to sources_path # can we do a render here?
    end
  end

  def strong_comment_params
    params.require(:comment).permit(:content)
  end

end
