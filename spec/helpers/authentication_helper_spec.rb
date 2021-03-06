# frozen_string_literal: true
require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe AuthenticationHelper, type: :helper do
  it 'test that current_user comes from session user_id' do
    user = create(:user)
    login(user)
    expect(helper.current_user).to eq user
  end

  it 'test that before login current user is GuestUser' do
    expect(helper.current_user).to be_a GuestUser
  end
end
