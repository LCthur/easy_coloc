class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :task
  has_one :task
  has_one :user
end
