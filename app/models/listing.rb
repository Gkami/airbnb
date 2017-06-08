class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  paginates_per 10
  mount_uploaders :photos, AvatarUploader

 def self.search(search)
 	where("state LIKE ? OR address1 LIKE ?", "%#{search}%", "%#{search}%")
 end



end
