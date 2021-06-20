class Source < ApplicationRecord
  belongs_to :user
  belongs_to :folder, optional: true
  has_many :quotes, dependent: :destroy
  has_one_attached :photo
  has_many :source_tags
  has_many :tags, through: :source_tags


  validates :title, presence: true
  validates :website, presence: true
  # validates :date_of_article, presence: true
  validates :user_id, presence: true
  # validates :folder_id, presence: true
  validates :url_of_website, presence: true

  include PgSearch::Model
  pg_search_scope :filter_sources_with_quotes,
    against: [ :title, :website ],
    associated_against: {
      quotes: [ :content ]
    },
    using: {
      tsearch: { prefix: true } # <-- to be able to search for not full words
    }

  multisearchable against: [:title, :website]

  def captured_by_user?(current_user)
    self.user == current_user 
  end

  def capturer_followed_by_user?(current_user)
    self.user.followers.map(&:id).include?(current_user.id) 
  end

  # Returns Active Record Association of Sources of people the user follows in descending
  # order or nil if user doesn't follow anybody.
  def self.sources_ordered_for_friends_feed(current_user)
    Source.all.where(user: current_user.following)&.order(created_at: :desc)
  end

  # Returns Active Record Association of Sources user captured in descending 
  # order or nil if user hasn't made any captures yet.
  def self.sources_ordered_for_profile_overview(viewed_user)
    Source.all.where(user: viewed_user)&.order(created_at: :desc)
  end

  # Returns Active Record Association of all Sources in descending order of created at 
  # date where user didn't do the Capture themselves
  def self.sources_ordered_for_discover_feed(current_user)
    Source.all.where.not(user: current_user).order(created_at: :desc)
  end

end


