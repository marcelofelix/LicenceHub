# frozen_string_literal: true
#
# Controller responsible to manage the user session
class SessionController < ApplicationController
  def create
    user = User.find_by_email(email) unless email.empty?
    if user&.authenticate(password)
      session[:user_id] = user.id
      redirect_to home_index_path
    else
      redirect_to home_index_path, flash: { error: 'Usuário ou senha invalidos' }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_index_path
  end

  private

  def email
    params[:email]
  end

  def password
    params[:password]
  end
end
