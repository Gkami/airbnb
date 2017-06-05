class UsersController < Clearance::UsersController
	before_action :require_login
  before_action :find_user, only: [:show, :edit, :update]
	

	def index
		@users=User.all
		# @users = User.order(:name).page params[:page]
	end

  def show
    @bookings = @user.bookings
  end


	def edit
   
  end

  def update
  
    p edit_user_params
    if @user.update(edit_user_params)
    	flash[:notice] = "Your profile has been updated"
    	redirect_to root_path
    else
    	flash.now[:notice] = "There are errors."
    	p @user.errors
    	render :edit
    end
  end

	# def create
	# 	@user=User.new(param[:user])
	# 	@user.save
	# end

	private

  def find_user
    @user = User.find(params[:id])
  end

	# def user_from_params
 #    params.require(:user).permit(:avatar, :email, :password, :username)
 #  end

  def edit_user_params
  	params.require(:user).permit(:avatar, :email, :username)
  end
end