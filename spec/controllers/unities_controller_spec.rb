# frozen_string_literal: true
require 'rails_helper'

RSpec.describe UnitiesController, type: :controller do
  it 'test list unities by client' do
    user = login(create(:user))
    client = create(:client)
    create_list(:unity, 5)
    get :index, params: { client_id: client.id }
    expect(response).to be_success
  end

  it 'test open form to create new unity' do
    login(create(:user))
    get :new
    expect(response).to be_success
  end

  describe 'create unity' do
    it 'test that when success redirect to unities' do
      user = login(create(:user))
      client = create(:client)
      post :create, params: {
        client_id: client.id,
        unity: {
          name: 'Unidade SP'
        }
      }
      expect(response).to redirect_to unities_path
      expect(Unity.count).to eq 1
    end

    it 'test that when fail stay at same page' do
      login(create(:user))
      post :create, params: {
        unity: {
          name: 'Unidade SP'
        }
      }
      expect(response).to render_template('new')
    end
  end
end
