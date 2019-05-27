class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :flat
  has_many :assignments
  has_many :issues
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
