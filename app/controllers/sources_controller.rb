class SourcesController < ApplicationController

  def index
    @sources = Source.all
  end

  def new
    @source = Source.new
  end

end
