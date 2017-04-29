# frozen_string_literal: true
#
# The user of a company that will handle
# the requisitions of services
class User < ApplicationRecord
  has_secure_password
  belongs_to :company
end
