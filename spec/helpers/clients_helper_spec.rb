# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ClientsHelper, type: :helper do
  it 'test client potions' do
    user = login(create(:user))
    create_list(:client, 2)
    helper.client_options
  end

  it 'test select_clients' do
    user = login(create(:user))
    create_list(:client, 2)
    helper.select_clients
  end
end
