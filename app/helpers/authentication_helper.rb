# frozen_string_literal: true
#
# Basic application helper
module AuthenticationHelper
  def current_user
    user_id = session[:user_id]
    @current_user ||= user_id ? User.find(user_id) : GuestUser.new
  end

  def loged?
    current_user.is_a? User
  end
end
