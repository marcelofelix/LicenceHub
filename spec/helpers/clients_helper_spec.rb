# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ClientsHelper, type: :helper do
  it 'test client options' do
    user = login(create(:user))
    create_list(:client, 2)
    helper.client_options
  end

  it 'test select_clients' do
    user = login(create(:user))
    create_list(:client, 2)
    helper.select_clients
  end

  it 'test that when user is a provider the client comes from parameter' do
    client = create(:provider)
    login create(:user, client: client)
    params[:client_id]  = client.id
    expect(helper.client).to eq client
  end
end
