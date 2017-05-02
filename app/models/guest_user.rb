# frozen_string_literal: true
#
# Before a user make login they is a GuestUser
class GuestUser
  def logged?
    false
  end
end
