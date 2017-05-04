# frozen_string_literal: true
require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:user) { create(:user, account: create(:account_manager)) }

  it 'test list accounts' do
    login(user)
    expect(Account).to receive(:where).with(parent: user.account)
      .and_call_original

    get :index
    expect(response).to be_success
  end

  it 'test create account' do
    login(user)

    post :create, params: {
      account: {
        name: 'ACME'
      }
    }
    expect(response).to redirect_to accounts_path
    expect(Account.count).to eq 2
  end

  it 'test that try to create account with invalid params do not work' do
    login(user)

    post :create, params: {
      account: { name: nil }
    }
    expect(response).to render_template 'new'
    expect(Account.count).to eq 1
  end
end
