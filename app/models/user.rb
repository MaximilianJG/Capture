class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :folders, dependent: :destroy
  has_many :sources, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :username, presence: true, uniqueness: true
end
