class Deal < ApplicationRecord
  belongs_to :assignment
  has_one :assignment
end
