# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'test that Account do not implement add_account' do
    expect { subject.add_account({}) }.to throw_symbol :not_implemented
  end
end
