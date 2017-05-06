# frozen_string_literal: true
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { login create(:user) }
  let(:provider_user) { login create(:provider_user) }

  it 'test list users' do
    create_list(:user, 5, account: user.account)
    get :index
    expect(response).to be_success
  end

  it 'test show form to new user' do
    provider_user
    get :new
    expect(response).to be_success
  end

  describe 'edit' do
    it 'test that user it loaded' do
      expect(User).to receive(:find_by).with(
        id: provider_user.id.to_s,
        account: provider_user.account
      ).and_call_original
      get :edit, params: {
        id: provider_user.id
      }
      expect(response).to render_template 'edit'
    end

    it 'test that user not exists redirect to users' do
      provider_user
      get :edit, params: { id: 'x' }
      expect(response).to redirect_to users_path
    end
  end

  describe 'update' do
    it 'test that after update redirect to users' do
      provider_user.name = 'Name before'
      provider_user.save
      put :update, params: {
        id: provider_user.id,
        user: {
          name: 'Updated name',
          email: provider_user.email
        }
      }
      expect(response).to redirect_to users_path
      provider_user.reload
      expect(provider_user.name).to eq 'Updated name'
    end

    it 'test that when fail stay at page' do
      put :update, params: {
        id: provider_user.id,
        user: {
          name: nil,
          email: provider_user.email
        }
      }
      expect(response).to render_template 'edit'
    end
  end

  describe 'create user' do
    describe 'success' do
      it 'test that success redirect to index' do
        email = 'marcelo.felix@gmail.com'
        provider_user
        post :create, params: {
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
      provider_user
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
