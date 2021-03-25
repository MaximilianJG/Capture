class LikesController < ApplicationController

    def create
        @like = Like.new(user: current_user, comment_id: params[:format])
        authorize @like
        @like.save!
        redirect_to request.referrer
    end

    def destroy
        @likes = Like.where(user_id: current_user.id, comment_id: params["id"].to_i)
        authorize @likes
        @likes.destroy_all
        redirect_to request.referrer
    end
end
