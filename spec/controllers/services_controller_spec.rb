# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  it 'test list services filtered by logged user company' do
    user = create(:user)
    create_list(:service, 2, company: create(:company))
    create_list(:service, 3, company: user.company)

    expect(Service).to receive(:where).with(company: user.company).and_call_original
    session[:user_id] = user.id
    get :index
    expect(response).to be_success
  end

  it 'test create a service' do
    user = create(:user)
    session[:user_id] = user.id
    post :create, params: {
      service: {
        name: 'Alvaça de funcionamento',
        periodicity: :yearly
      }
    }
    expect(response).to redirect_to services_path
    expect(Service.count).to eq 1
  end
end
