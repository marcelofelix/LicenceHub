# frozen_string_literal: true
require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  it 'test list users' do
    user = login create(:user)
    login create(:user)
    create_list(:user, 5)
    get :index
    expect(response).to be_success
  end

  it 'test show form to new user' do
    login create(:user)
    get :new
    expect(response).to be_success
  end

  describe 'edit' do
    it 'test that user it loaded' do
      login create(:user)
      another_user = create(:user)
      get :edit, params: { id: another_user.id }
      expect(response).to render_template 'edit'
    end
  end

  describe 'update' do
    it 'test that after update redirect to users' do
      user = login create(:user)
      another_user = create(:user, name: 'Name before')
      put :update, params: {
        id: another_user.id,
        user: {
          name: 'Updated name',
          email: another_user.email
        }
      }
      expect(response).to redirect_to users_path
      another_user.reload
      expect(another_user.name).to eq 'Updated name'
    end

    it 'test that when fail stay at page' do
      user = login create(:user)
      put :update, params: {
        id: user.id,
        user: {
          name: nil,
          email: user.email
        }
      }
      expect(response).to render_template 'edit'
    end
  end

  describe 'create user' do
    describe 'success' do
      it 'test that success redirect to index' do
        email = 'marcelo.felix@gmail.com'
        user = login create(:user)
        post :create, params: {
          client_id: user.client.id,
          user: {
            name: 'Marcelo',
            email: email,
            password: '123456'
          }
        }
        expect(response).to redirect_to users_path
        expect(User.find_by_email(email)).to_not be_nil
      end
    end
  end

  describe 'fail' do
    it 'test that if fail stay at same page and show error' do
      email = 'marcelo.felix@gmail.com'
      login create(:user)
      post :create, params: {
        user: {
          email: email,
          password: '123456'
        }
      }
      expect(response).to render_template 'new'
      expect(User.find_by_email(email)).to be_nil
    end
  end
end
