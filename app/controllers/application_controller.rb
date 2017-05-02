# frozen_string_literal: true
#
# Basic application controller
class ApplicationController < ActionController::Base
  include AuthenticationHelper

  protect_from_forgery with: :exception

  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.uuid
    # payload[:user_id] = current_user.id if current_user
    # payload[:visit_id] = ahoy.visit_id # if you use Ahoy
  end

  def authorize
    redirect_to '/' unless current_user.logged?
  end
end
