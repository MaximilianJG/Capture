class SourcesController < ApplicationController
  before_action :set_source, only: [:show]

  # READ
  def index
    # only show sources that the user has created himself (e.g. record.user == user)
    @sources = policy_scope(Source).where(user: current_user)
  end

  def show
  end

  # CREATE

  def new
  end

  # UPDATE

  private

  def set_source
    @source = Source.find(params[:id])
    authorize @source
  end
end
