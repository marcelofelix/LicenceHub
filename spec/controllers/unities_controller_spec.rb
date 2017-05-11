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

  it 'test show unity' do
    user = login create(:user)
    unity = create(:unity)

    expect(Unity).to receive(:find_by)
      .with(id: unity.id.to_s, client: unity.client)
      .and_call_original

    get :show, params: {
      id: unity.id,
      client_id: unity.client.id
    }
    expect(response).to be_success
  end

  it 'test that show invalid unity redirect to unities' do
    user = login create(:user)
    unity = create(:unity)

    get :show, params: { id: unity.id }
    expect(response).to redirect_to unities_path
    expect(flash[:error]).to be 'Unidade inválida'
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

  describe 'update' do
    it 'test that after success redirect to index' do
      user = login create(:user)
      unity = create(:unity, name: 'Old name')
      post :update, params: {
        id: unity.id,
        unity: {
          name: 'New Name'
        }
      }

      expect(response).to redirect_to unities_path
      unity.reload
      expect(unity.name).to eq 'New Name'
    end


    it 'test that if fail to update stay at sabe page' do
      user = login create(:user)
      unity = create(:unity, name: 'Old name')
      post :update, params: {
        id: unity.id,
        unity: {
          name: nil
        }
      }

      expect(response).to render_template('edit')
    end
  end
end
