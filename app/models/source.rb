class Source < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  has_many :quotes, dependent: :destroy
  has_one_attached :photo


  # validates :title, :website, :url_of_website, presence: true

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
end

# for later versions some prioritizing:
#
#   include PgSearch::Model
#   pg_search_scope :search_full_text, against: {
#     title: 'A',
#     subtitle: 'B',
#     content: 'C'
#   }
# end
