class User < ApplicationRecord
  include Clearance::User

	# has_secure_password
	has_many :listings, dependent: :destroy
	has_many :reservations, dependent: :destroy
	

	validates :username, presence: true #{message: "Please fill-in all fields" }
	# validates :email, uniqueness: { message: "must be new"}
	# validates :email, format: { with: /\w*@.*\.\w*/, message: "Invalid email address" } 
	validates :password, length: { minimum: 6, message: "Password must be at least 6 characters" }





end
