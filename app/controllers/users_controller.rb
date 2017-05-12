# frozen_string_literal: true
#
# Crud of users
class UsersController < ApplicationController
  include ClientsHelper
  before_action :authorize
  layout 'logged'

  def index
    @users = []
    @users = User.where(client: client) if client
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.client = client
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
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
