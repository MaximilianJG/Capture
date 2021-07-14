class FoldersController < ApplicationController
  before_action :folder_page?, only: [:show]


  def show
    @folder = Folder.find(params[:id])
    authorize @folder
    @heading = @folder.folder_name
    if params[:folder_filter_query].present?
      # search for sources with query
      @sources = policy_scope(Source).filter_sources_with_quotes(params[:folder_filter_query]).where(user: current_user)
      # search for sources that fit the query that are in the folder
      @sources = @sources.where(user: current_user).select { |source| source.folder_id == @folder.id }
    else
      # search for sources in the folder
      @sources = Source.select { |source| source.folder_id == @folder.id } # all has to be replaced by some pundit thing
      # where(user: current_user)
    end

    @sources = @sources.sort_by { |source| source.created_at } # isn't working yet either
    # @sources = @sources.order(created_at: :desc) <-- is not working because its not active record
    @no_right_column = true

    # only show private sources to owner of folder
    if @folder.user != current_user
      @sources.where(private: false)
    end

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
      redirect_to sources_path # this could be redirect_back(fallback_location: root_path)
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

