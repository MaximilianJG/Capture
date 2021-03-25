class CommentVotesController < ApplicationController

    def create
        @comment_vote = CommentVote.new(user: current_user, comment_id: params[:format])
        authorize @comment_vote
        @comment_vote.save!
        redirect_to request.referrer
    end

    def destroy
        @comment_votes = CommentVote.where(user_id: current_user.id, comment_id: params["id"].to_i)
        authorize @comment_votes
        @comment_votes.destroy_all
        redirect_to request.referrer
    end
end
