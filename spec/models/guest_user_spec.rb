# frozen_string_literal: true
require 'rails_helper'

RSpec.describe GuestUser, type: :model do
  it 'test that guest user is not authenticated' do
    user = GuestUser.new
    expect(user.logged?).to be_falsey
  end
end
