# frozen_string_literal: true
#
# Provider is a type of Account and is who use LicenceHub
# to provide service to others
# All they children should be Clients
class Provider < Account
  def add_account(params)
    account = Client.new(params)
    account.parent = self
    account
  end
end
