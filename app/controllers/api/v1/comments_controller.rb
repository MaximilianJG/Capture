class Api::V1::CommentsController < Api::V1::BaseController

  def create
    current_user = User.find(comment_post_request_params[:user_id])
    @quote = Quote.find(comment_post_request_params[:quote_id])
    print @quote
    authorize @quote


    @comment = Comment.new(content: comment_post_request_params[:comment])
    print(@comment)
    authorize @comment
    @comment.quote = @quote
    @comment.user = current_user
    @comment.save!
    render :show

  end

  def comment_post_request_params
    params.require(:comment_post_request).permit(:user_id, :quote_id, :comment)
  end

  def render_error
    render json: { errors: @source.errors.full_messages },
      status: :unprocessable_entity
  end


end
