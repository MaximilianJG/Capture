class CommentsController < ApplicationController

  def create
    if params["comment"]["quote_id"] != nil
      raise
      @quote = Quote.find(params["comment"]["quote_id"])
    else
      @quote = Quote.find(params[:quote_id])
    end

    @comment_id = params["comment"]["comment_id"].to_i

    if !params[:source_id].nil?
      @source = Source.find(params[:source_id])
    else
      @source = Source.find(@quote.source_id)
    end

   if params["comment"]["content"] != nil
      @comment = Comment.new(content: params["comment"]["content"])
   else
      @comment = Comment.new(content: params[:content]) # how do I build this with strong_comment_params
   end

    authorize @comment

    @comment.quote = @quote
    @comment.user = current_user
    @comment.comment_id = @comment_id

    if @comment.save!
      redirect_back(fallback_location: root_path)
      else
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @new_comment = Comment.new
    authorize @comment
  end

  def strong_comment_params
    params.require(:comment).permit(:content)
  end

  def destroy
    @comment = Comment.find_by_id(params[:id].to_i)
    authorize @comment
    @comment.destroy!
    redirect_to request.referrer
  end

end
