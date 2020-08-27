class FoldersController < ApplicationController
  before_action :folder_page?, only: [:show]

  def show
    @folder = Folder.find(params[:id])
    authorize @folder

    @sources = Source.where(user: current_user).select { |source| source.folder_id == @folder.id } # all has to be replaced by some pundit thing
  end

  def folder_page?
    @folder_page = true
  end
end
