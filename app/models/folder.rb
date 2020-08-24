class Folder < ApplicationRecord
  belongs_to :user
  has_many :sources, dependent: :destroy
end
