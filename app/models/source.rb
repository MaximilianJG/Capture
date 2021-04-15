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

  # Returns Active Record Association or Sources of people the user follows in descending
  # order or nil if user doesn't follow anybody.
  def self.sources_ordered_for_friends_feed(current_user)
    Source.all.where(user: current_user.following)&.order(created_at: :desc)
  end
end


