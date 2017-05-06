# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Provider, type: :model do
  it 'test that provider add clients' do
    account = subject.add_account(name: 'Teste')
    expect(account).to be_a Client
  end
end
