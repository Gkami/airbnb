class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery
# def allowed?(action:, user:)
# 	if action == "new" && user.customer?
#       flash[:notice] = "Sorry. You are not allowed to perform this action."
#       return redirect_to root_url, notice: "Sorry. You do not have the permission to verify a property."
#       # end authorization code
#   elsif action == user.admin?


#       # other code to make the new action work!
#      end
#   end

end
