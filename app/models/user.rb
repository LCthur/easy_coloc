class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar_photo, PhotoUploader
  belongs_to :flat, optional: true
  has_many :assignments, dependent: :destroy
  has_many :issues, dependent: :destroy
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
