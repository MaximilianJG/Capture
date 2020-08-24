class Source < ApplicationRecord
  belongs_to :user
  belongs_to :folder

  validates :title, :website, :date_of_article, :date_time_of_save, :url_of_website, presence: true
end
