# frozen_string_literal: true
#
# User is the heavier user of LicenceHub, they are who will
# handle all Client's requisitions.
#
# A User belongs to a Company and can  provide services only for clients
# of this Company.
#
# The password of user is stored using 'bcrypt' into database
class User < ApplicationRecord
  has_secure_password
  belongs_to :company

  def logged?
    true
  end
end
