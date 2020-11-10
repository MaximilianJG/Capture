class Folder < ApplicationRecord
  belongs_to :user
  has_many :sources, dependent: :destroy

  validates :folder_name, presence: true

  include PgSearch::Model
  multisearchable against: [:folder_name]

end
