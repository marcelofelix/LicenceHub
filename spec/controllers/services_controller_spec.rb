# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  it 'test list services filtered by logged user client' do
    user = create(:user)
    create_list(:service, 3)

    expect(Service).to receive(:paginate).and_call_original
    login(user)
    get :index
    expect(response).to be_success
  end

  it 'test create a service' do
    user = create(:user)
    login(user)
    post :create, params: {
      service: {
        name: 'Alvaça de funcionamento',
        periodicity: :yearly
      }
    }
    expect(response).to redirect_to services_path
    expect(Service.count).to eq 1
  end

  it 'test that create service with invalid params do not redirect to index' do
    user = create(:user)
    login(user)
    post :create, params: {
      service: { name: 'Alvaça de funcionamento' }
    }
    expect(response).to_not redirect_to services_path
    expect(Service.count).to eq 0
  end

  it 'test go create a new service' do
    user = create(:user)
    login(user)
    expect(Service).to receive(:new)
    get :new
    expect(response).to be_success
  end

  it 'test go edit a service' do
    user = create(:user)
    service = create(:service, name: 'alvara')
    login(user)
    expect(Service).to receive(:find).with(service.id.to_s)
    get :edit, params: { id: service.id }
    expect(response).to be_success
  end

  it 'test update a service' do
    user = create(:user)
    service = create(:service, name: 'alvara')
    login(user)
    put :update, params: {
      id: service.id,
      service: { id: service.id, name: 'Alvara', periodicity: :daily }
    }
    expect(response).to redirect_to services_path
    service.reload
    expect(service.name).to eq 'Alvara'
  end

  it 'test that update service with invalid values do not redirect to index' do
    user = create(:user)
    service = create(:service, name: 'alvara')
    login(user)
    get :update, params: {
      id: service.id,
      service: { id: service.id, name: nil }
    }
    expect(response).to have_http_status 200
  end

  it 'test periodicity values' do
    expect(subject.periodicity).to match_array [
      ['Diario', :daily], ['Mensal', :monthly], ['Anual', :yearly]
    ]
  end
end
