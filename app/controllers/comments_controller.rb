class CommentsController < ApplicationController

  def create

    @quote = Quote.find(params[:quote_id])

    if !params[:source_id].nil?
      @source = Source.find(params[:source_id])
    else
      @source = Source.find(@quote.source_id)
    end

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
