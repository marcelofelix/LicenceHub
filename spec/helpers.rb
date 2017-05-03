# frozen_string_literal: true
#
# Helper methods to be used in tests
module Helpers
  def login(user)
    session[:user_id] = user.id
  end
end
