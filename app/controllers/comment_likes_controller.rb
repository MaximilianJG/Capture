class CommentLikesController < ApplicationController

    def create
        @comment_like = CommentLike.new(user: current_user, comment_id: params[:format])
        authorize @comment_like
        @comment_like.save!
        redirect_to request.referrer
    end

    def destroy
        @comment_likes = CommentLike.where(user_id: current_user.id, comment_id: params["id"].to_i)
        authorize @comment_likes
        @comment_likes.destroy_all
        redirect_to request.referrer
    end
end
