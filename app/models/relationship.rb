class Relationship < ApplicationRecord
  belongs_to :asker, class_name: "User"#, dependent: :destroy
  belongs_to :receiver, class_name: "User"#, dependent: :destroy

  enum status: [:pending, :accepted, :declined]

end
