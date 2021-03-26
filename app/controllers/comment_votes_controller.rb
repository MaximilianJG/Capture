class CommentVotesController < ApplicationController
    def create
        @comment_vote = current_user&.comment_votes&.where(comment_id: params[:format])&.first
        if @comment_vote == nil
            @new_comment_vote = CommentVote.new(user: current_user, comment_id: params[:format], value: 1)
            authorize @new_comment_vote
            @new_comment_vote.save!
        else
            authorize @comment_vote
            @comment_vote.upvote
        end
        redirect_to request.referrer
    end

    def destroy
        @comment_vote = current_user&.comment_votes&.where(comment_id: params[:id])&.first
        if @comment_vote == nil
            @new_comment_vote = CommentVote.new(user: current_user, comment_id: params[:id], value: -1)
            authorize @new_comment_vote
            @new_comment_vote.save!
        else
            authorize @comment_vote
            @comment_vote.downvote
        end
        redirect_to request.referrer
    end
end
