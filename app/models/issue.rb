class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :assignment
  has_one :user
  has_one :assignment
end
