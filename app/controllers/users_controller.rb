class UsersController < ApplicationController
	before_action :require_login

	def index
		@users=User.all
	end

	# def create
	# 	@user=User.new(param[:user])
	# 	@user.save
	# end
end