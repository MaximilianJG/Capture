class Folder < ApplicationRecord
  belongs_to :user
  validates :folder_name, presence: true, uniqueness: true
end
