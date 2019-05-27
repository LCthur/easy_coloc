class Task < ApplicationRecord
  has_many :assignments, dependent: :destroy
end
