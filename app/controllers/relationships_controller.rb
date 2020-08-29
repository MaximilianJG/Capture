class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @follower = User.find(params[:follow_id])

    @relationship = Relationship.new(asker: @user, receiver: @follower, status: 1)
    authorize @relationship
    @relationship.save!

    redirect_back(fallback_location: root_path)
  end

  def update
  end

  def destroy
    @user = User.find(params[:user_id])
    @follower = User.find(params[:follow_id])

    @relationship = Relationship.where(asker: @user, receiver: @follower)[0]
    authorize @relationship
    @relationship.destroy

    redirect_back(fallback_location: root_path)

  end


end
