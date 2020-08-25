class Source < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  has_many :quotes, dependent: :destroy

  # validates :title, :website, :url_of_website, presence: true
end
