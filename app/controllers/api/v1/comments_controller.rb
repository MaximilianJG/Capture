class Api::V1::CommentsController < Api::V1::BaseController

  def create
    current_user = User.find(comment_post_request_params[:user_id])
    @quote = Quote.where(user: current_user).find_by(content: comment_post_request_params[:quote_content])
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
    params.require(:comment_post_request).permit(:user_id, :quote_content, :url_of_quote, :comment)
  end

  def render_error
    render json: { errors: @source.errors.full_messages },
      status: :unprocessable_entity
  end


end
