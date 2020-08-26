class Source < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  has_many :quotes, dependent: :destroy

  # validates :title, :website, :url_of_website, presence: true

  # initialize for pgsearch GEM
  include PgSearch::Model
  pg_search_scope :search_for_all,
    against: [ :title, :website ],
    associated_against: {
      quotes: [ :content ]
    },
    using: {
      tsearch: { prefix: true } # <-- to be able to search for not full words
    }
end



#   include PgSearch::Model
#   pg_search_scope :search_full_text, against: {
#     title: 'A',
#     subtitle: 'B',
#     content: 'C'
#   }
# end
