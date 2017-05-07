# frozen_string_literal: true
require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UnitiesHelper. For example:
#
# describe UnitiesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AccountHelper, type: :helper do
  it 'test accounts potions' do
    user = login(create(:provider_user))
    create_list(:client, 2, parent: user.account)
    helper.account_options
  end

  it 'test select_account' do
    user = login(create(:provider_user))
    create_list(:client, 2, parent: user.account)
    helper.select_accounts
  end
end
