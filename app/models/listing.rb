class Listing < ApplicationRecord
  belongs_to :user
  paginates_per 10
  mount_uploaders :photos, AvatarUploader
end
