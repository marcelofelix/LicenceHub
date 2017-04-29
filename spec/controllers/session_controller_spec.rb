# frozen_string_literal: true
require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  it 'test that user can be authenticated with email and password' do
    user = create(:user, email: 'teste@teste.com', password: 'teste')
    post :create, params: { email: user.email, password: user.password }
    expect(response).to redirect_to home_index_path
    expect(flash[:error]).to be_nil
  end

  it 'test that invalid email and password show error' do
    create(:user, email: 'teste@teste.com', password: 'teste')
    post :create, params: { email: 'x', password: 'x' }
    expect(response).to redirect_to home_index_path
    expect(flash[:error]).to match('Usuário ou senha invalido')
  end

  it 'test that destroy clean the session' do
    user = create(:user)
    session[:user_id] = user.id
    delete :destroy
    expect(response).to redirect_to home_index_path
    expect(session[:user_id]).to be_nil
  end
end
