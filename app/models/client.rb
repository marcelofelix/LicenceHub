# frozen_string_literal: true
#
# Client is a type of Account and is who use LicenceHub
# to ask for service to Providers
# Client can not have children accounts
class Client < Account
  def add_account(params)
    throw :client_can_not_have_another_counts
  end
end
