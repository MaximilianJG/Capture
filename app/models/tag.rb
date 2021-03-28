class Tag < ApplicationRecord
  has_many :source_tags
  has_many :sources, through: :source_tags
  has_many :user_tags
  has_many :users, through: :user_tags
end
