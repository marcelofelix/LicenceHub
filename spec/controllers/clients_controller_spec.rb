# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  let(:user) { create(:user) }

  it 'test list client' do
    login(user)
    expect(Client).to receive(:paginate).and_call_original

    get :index
    expect(response).to be_success
  end

  it 'test create client' do
    login(user)

    post :create, params: {
      client: {
        name: 'ACME'
      }
    }
    expect(response).to redirect_to clients_path
    expect(Client.count).to eq 2
  end

  it 'test that try to create client with invalid params do not work' do
    login(user)

    post :create, params: {
      client: { name: nil }
    }
    expect(response).to render_template 'new'
    expect(Client.count).to eq 1
  end

  it 'test go to create a new client' do
    login(user)
    get :new
    expect(response).to be_success
  end

  it 'test go to create a new client' do
    login(user)
    client = create(:client, name: 'Teste')

    expect(Client).to receive(:find)
      .with(client.id.to_s)
      .and_call_original

    get :edit, params: { id: client.id }
    expect(response).to be_success
  end

  it 'test update client' do
    login(user)
    client = create(:client, name: 'Test')

    put :update, params: {
      id: client.id,
      client: { name: 'Another client' }
    }
    expect(response).to redirect_to clients_path
    client.reload
    expect(client.name).to eq 'Another client'
  end

  it 'test update client' do
    login(user)
    client = create(:client, name: 'Test')

    put :update, params: {
      id: client.id,
      client: { name: nil }
    }
    expect(response).to render_template 'edit'
  end
end
