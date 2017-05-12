# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Client, type: :model do
  it 'test that client name should have more than 3 letters' do
    client = Client.new(name: 'x')
    expect(client.valid?).to be_falsy
  end
end
