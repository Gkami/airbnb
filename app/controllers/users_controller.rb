class UsersController < ApplicationController
	before_action :require_login
	

	def index
		@users=User.all
		# @users = User.order(:name).page params[:page]
	end


def edit
	@user=current_user
end


	# def create
	# 	@user=User.new(param[:user])
	# 	@user.save
	# end
end