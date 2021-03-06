class Api::V1::TagsController < Api::V1::BaseController

  def index
    @tags = policy_scope(Tag)
    render :index
  end

  def tag_post_request_params
    params.require(:tag_post_request).permit(:user_id, :quote_content, :url_of_quote, :comment)
  end

  def render_error
    render json: { errors: @source.errors.full_messages },
      status: :unprocessable_entity
  end
end
