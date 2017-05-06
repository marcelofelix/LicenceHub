# frozen_string_literal: true
require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let(:user) { create(:user, account: create(:manager)) }

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

  it 'test go to create a new account' do
    login(user)
    get :new
    expect(response).to be_success
  end

  it 'test go to create a new account' do
    login(user)
    account = user.account.add_account(name: 'Teste')
    account.save

    expect(Account).to receive(:where)
      .with(id: account.id.to_s, parent: user.account)
      .and_call_original

    get :edit, params: { id: account.id }
    expect(response).to be_success
  end

  it 'test update account' do
    login(user)
    account = user.account.add_account(name: 'Teste')
    account.save

    expect(Account).to receive(:where)
      .with(id: account.id.to_s, parent: user.account)
      .and_call_original

    put :update, params: {
      id: account.id,
      account: { name: 'Another account' }
    }
    expect(response).to redirect_to accounts_path
    account.reload
    expect(account.name).to eq 'Another account'
  end

  it 'test update account' do
    login(user)
    account = user.account.add_account(name: 'Teste')
    account.save

    expect(Account).to receive(:where)
      .with(id: account.id.to_s, parent: user.account)
      .and_call_original

    put :update, params: {
      id: account.id,
      account: { name: nil }
    }
    expect(response).to render_template 'edit'
  end
end
