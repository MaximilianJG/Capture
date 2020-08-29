class RelationshipsController < ApplicationController

  def create

    @follower = User.find(params[:id])
    @relationship = Relationship.new(asker: current_user, receiver: @follower, status: 1)
    authorize @relationship
    @relationship.save!

    redirect_back(fallback_location: root_path)
  end

  def update
  end

  def destroy
    @follower = User.find(params[:id])

    @relationship = Relationship.where(asker: current_user, receiver: @follower)[0]
    authorize @relationship
    @relationship.destroy

    redirect_back(fallback_location: root_path)

  end


end
