# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User do
  it 'test that user is logged' do
    user = User.new
    expect(user.logged?).to eq true
  end

  it 'test find user by account' do
    first = create(:provider)
    second = create(:provider)

    first_users = create_list(:user, 5, account: first)
    second_users = create_list(:user, 3, account: second)

    expect(User.by_account(first)).to eq first_users
    expect(User.by_account(second)).to eq second_users
  end
end
