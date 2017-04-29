# frozen_string_literal: true
#
# Basic application controller
class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception

  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.uuid
    # payload[:user_id] = current_user.id if current_user
    # payload[:visit_id] = ahoy.visit_id # if you use Ahoy
  end

  def current_user
    user_id = session[:user_id]
    @current_user ||= user_id ? User.find(user_id) : GuestUser.new
  end

  def loged?
    current_user.is_a? User
  end

  helper_method :current_user, :loged?

  def authorize
    redirect_to '/' unless current_user
  end
end
