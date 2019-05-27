class Assignment < ApplicationRecord
  belongs_to :user
  belongs_to :task
  has_many :deals, dependent: :destroy
  has_many :issues, dependent: :destroy
end
