class FoldersController < ApplicationController
  before_action :folder_page?, only: [:show]

  def show
    @folder = Folder.find(params[:id])
    authorize @folder

    @sources = Source.where(user: current_user).select { |source| source.folder_id == @folder.id } # all has to be replaced by some pundit thing
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)
    if @folder.save
      redirect_to sources_path
    else
      render :new
    end
  end


private

def folder_params
  params.require(:source).permit(:folder_name)
end

def folder_page?
  @folder_page = true
end

end

