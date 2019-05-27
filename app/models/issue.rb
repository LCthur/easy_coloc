class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :assignment
end
