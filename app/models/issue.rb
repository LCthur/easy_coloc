class Issue < ApplicationRecord
  belongs_to :assignment
  belongs_to :roommate
end
