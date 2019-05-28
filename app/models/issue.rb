class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :assignment
  mount_uploader :photo, PhotoUploader
end
