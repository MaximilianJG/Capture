class FoldersController < ApplicationController
  before_action :folder_page?, only: [:show]


  def show
    @folder = Folder.find(params[:id])
    authorize @folder
    @sources = Source.where(user: current_user).select { |source| source.folder_id == @folder.id } # all has to be replaced by some pundit thing
  end

  def new
    @folder = Folder.new
    authorize @folder
  end

  def create
    @folder = Folder.new(folder_params)
    @folder.user = current_user
    authorize @folder
    if @folder.save!
      redirect_to sources_path
    else
      render :new
    end
  end


private

def folder_params
  params.require(:folder).permit(:folder_name)
end

def folder_page?
  @folder_page = true
end

def authorize_folder
  authorize @folder
end

end

