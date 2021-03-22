class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :folders, dependent: :destroy
  has_many :sources, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, dependent: :destroy
  has_one_attached :photo

  after_create :make_default_folder

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  acts_as_token_authenticatable

  include PgSearch::Model
  multisearchable against: [:username, :first_name, :last_name] # make Searchable by firstname and lastname



  def followers
    relationships = Relationship.where(receiver: self, status: 1)
    users = relationships.map { |relationship| relationship.asker }
  end

  def following
    relationships = Relationship.where(asker: self, status: 1)
    users = relationships.map { |relationship| relationship.receiver }
  end

  private

  def make_default_folder
    Folder.create(folder_name: "My Latest Captures", user: self)
  end

end
