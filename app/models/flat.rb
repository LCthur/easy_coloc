class Flat < ApplicationRecord
  has_many :users
  has_many :assignments, through: :users
end
