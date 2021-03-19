class Api::V1::SourcesController < Api::V1::BaseController
  def create
    @source = Source.new(api_source_params)

  end

  def api_source_params
    params.require(:source).permit(:title, :date_of_article, :url_of_website) # how do we get a photo?
  end
end
