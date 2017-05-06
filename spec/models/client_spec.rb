# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Client, type: :model do
  it 'test that Account do not implement add_account' do
    expect { subject.add_account({}) }.to throw_symbol :client_can_not_have_another_counts
  end
end
