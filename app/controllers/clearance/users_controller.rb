class Clearance::UsersController < Clearance::BaseController
  if respond_to?(:before_action)
    before_action :redirect_signed_in_users, only: [:create, :new]
    skip_before_action :require_login, only: [:create, :new], raise: false
    skip_before_action :authorize, only: [:create, :new], raise: false
  else
    before_filter :redirect_signed_in_users, only: [:create, :new]
    skip_before_filter :require_login, only: [:create, :new], raise: false
    skip_before_filter :authorize, only: [:create, :new], raise: false
  end

  def show
      @user = User.find(params[:id])
  end

  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = User.new(user_from_params)

    if @user.save
      sign_in @user
      # redirect_back_or url_after_create
      redirect_to listing_path
    else
       flash[:notice] = "Make sure you include your name and a valid email address"
      # respond_to do |format|
      # format.html {redirect_to @user}
        # format.js
       render template: "users/new"
      # end
    end
  end


  private

  def avoid_sign_in
    warn "[DEPRECATION] Clearance's `avoid_sign_in` before_filter is " +
      "deprecated. Use `redirect_signed_in_users` instead. " +
      "Be sure to update any instances of `skip_before_filter :avoid_sign_in`" +
      " or `skip_before_action :avoid_sign_in` as well"
    redirect_signed_in_users
  end

  def redirect_signed_in_users
    if signed_in?
      redirect_to Clearance.configuration.redirect_url
    end
  end

  def url_after_create
    Clearance.configuration.redirect_url
  end

  def user_from_params
    params.require(:user).permit(:avatar, :email, :password, :username)
    # email = user_params.delete(:email)
    # password = user_params.delete(:password)
    # username = user_params.delete(:username)

    # Clearance.configuration.user_model.new(user_params).tap do |user|
    #   user.email = email
    #   user.password = password
    #   user.username = username
    # end
  end

  # def user_params
  #   params[Clearance.configuration.user_parameter] || Hash.new
  # end
end