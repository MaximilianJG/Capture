class SourcesController < ApplicationController
  before_action :set_source, only: [:show]

  # READ
  def index
    @sources = Source.all

    # only show sources that the user has created himself (e.g. record.user == user)
    @source = policy_scope(Source).all
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
