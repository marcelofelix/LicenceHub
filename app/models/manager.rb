# frozen_string_literal: true
#
# Manager is a type of Account and is the owner of LicenceHub
# All they children should be Providers
class Manager < Account
  def add_account(params)
    account = Provider.new(params)
    account.parent = self
    account
  end
end
