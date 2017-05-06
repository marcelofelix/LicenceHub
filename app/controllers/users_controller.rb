# frozen_string_literal: true
#
# Crud of users
class UsersController < ApplicationController
  before_action :authorize

  def index
    @users = User.by_account(current_user.account)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by(id: params[:id], account: current_user.account)
    redirect_to users_path unless @user
    render 'edit' if @user
  end

  def create
    @user = User.new(user_params)
    @user.account = current_user.account
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find_by(id: params[:id], account: current_user.account)
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(:name, :email, :password)
  end
end
