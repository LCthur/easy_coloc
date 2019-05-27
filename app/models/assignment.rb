class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :task
  has_many :deals
  has_many :issues
end
