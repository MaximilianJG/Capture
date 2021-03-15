class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  # AKA My captures
  def index
    @heading = "My Captures"
    @no_right_column = true
    @sources = policy_scope(Source).where(folder: nil)

    # if params[:index_filter_query].present?
    #   @sources = policy_scope(Source).filter_sources_with_quotes(params[:index_filter_query]).where(user: current_user)
    # else
    #   @sources = policy_scope(Source).where(user: current_user)
    # end
    @sources = @sources.order(created_at: :desc)


    @folders = Folder.where(user: current_user)

    # automatic_create
    # file = URI.open("https://ichef.bbci.co.uk/news/240/cpsprodpb/15A8C/production/_117561788_eeaaf6ed-5fbe-4235-95f2-7fe3a49b420d.jpg")
    # @source.photo.attach(io: file, filename: 'image.jpg', content_type: 'image/jpg')



  end

  def show
    @heading = "My Captures"
    @source_page = true

    @all_comments = []
    @source.quotes.each do |quote|
      quote.comments.each do |comment|
        @all_comments << comment
      end
    end

    @source_quotes = @source.quotes

    respond_to do |format|
      format.html
      format.json {render json: {source_quotes: @source_quotes }}
    end

  end

  def new
    @source = Source.new
    authorize @source
  end

  def create
    @source = Source.new(strong_source_params)
    @source.user = current_user
    authorize @source

    if @source.save!
      redirect_to sources_path
      # not for Chrome Extension
      $quote.user_id = current_user.id
      $quote.source_id = @source.id
      $quote.save!
    else
      render :new
    end
  end

  def update
    # @source = Source.find(params[:id]) # can't this go away because we have @source ?
    if @source.update!(strong_source_params)
      redirect_back(fallback_location: root_path)
    else
      render :update
      # add alert that it failed
    end
  end

  def destroy
    @source.destroy
    redirect_to sources_path
  end


  def feed
    @heading = "Start"
    @no_right_column = true
    @sources = policy_scope(Source).where(user: current_user.following)
    authorize @sources
  end

  def automatic_create
    bbc_scraper
  end

  private

  def strong_source_params
    params.require(:source).permit(:title, :website, :date_of_article, :url_of_website, :folder_id, :photo)
  end

  def set_source
    @source = Source.find(params[:id])
    authorize @source
  end

  # require 'nokogiri'
  # require 'httparty'
  # require 'byebug'

  # def bbc_scraper
  #   website_url = 'https://www.bbc.com/'
  #   unparsed_page = HTTParty.get(website_url)
  #   parsed_page = Nokogiri::HTML(unparsed_page)
  #   news_listings = parsed_page.css('li.media-list__item')

  #   articles = Array.new

  #   news_listings.each do |news_listing|
  #     listing_url = 'https://www.bbc.com' + news_listing.css('a')[0].attributes['href'].value
  #     unparsed_page = HTTParty.get(listing_url)
  #     parsed_page = Nokogiri::HTML(unparsed_page)

  #     # Title
  #     if parsed_page.css('h1#main-heading').text.strip == ""
  #       article_title = parsed_page.css('header').text.strip
  #     else
  #       article_title = parsed_page.css('h1#main-heading').text.strip
  #     end

  #     content = ""
  #     parsed_page.css('[data-component="text-block"]').each do |text|
  #       content = "#{content} #{text.text.strip} \r\n\r\ "
  #     end

  #     unless parsed_page.css('[data-testid="timestamp"]')[0].nil?
  #       article_date = parsed_page.css('[data-testid="timestamp"]')[0].attributes['datetime'].value
  #     end


  #     article = {
  #       title: article_title,
  #       content: content,
  #       website: website_url,
  #       url_of_website: listing_url,
  #       date_of_article: article_date,
  #       user_id: 1,
  #       folder_id: 1
  #     }

  #     unless parsed_page.css('div[data-component="image-block"]')[0].nil?
  #       image_url = parsed_page.css('div[data-component="image-block"]')[0].css('span').css('img').to_html
  #       image_url[/\A.+?(?=https:\/\/)/mi] = ''
  #       image_url = image_url.gsub(/\s.+/, '').strip
  #     end


  #     @source = Source.new(article)

  #     @source.save!
  #   end
  # end


end
