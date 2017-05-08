# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User do
  it 'test that user is logged' do
    user = User.new
    expect(user.logged?).to eq true
  end
end
