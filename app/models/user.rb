class User < ApplicationRecord
  include Clearance::User
  paginates_per 10

  mount_uploader :avatar, AvatarUploader
  
  
	# has_secure_password
	has_many :listings, dependent: :destroy
	has_many :reservations, dependent: :destroy
	

	validates :username, presence: true #{message: "Please fill-in all fields" }
	# validates :email, uniqueness: { message: "must be new"}
	# validates :email, format: { with: /\w*@.*\.\w*/, message: "Invalid email address" } 
	validates :password, length: { minimum: 6, message: "Password must be at least 6 characters" }

#In app/models/user.rb    
has_many :authentications, :dependent => :destroy

  def self.create_with_auth_and_hash(authentication, auth_hash)
      user = User.create!(username: auth_hash["name"], email: auth_hash["extra"]["raw_info"]["email"], password: SecureRandom.hex(5))
      user.authentications << (authentication)      
      return user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

# you can also explicitly define enum as:  enum access_level: [:employee => 0, :company_admin => 1, :super_admin => 2}
  enum access_level: [:customer, :moderator, :admin]


end
