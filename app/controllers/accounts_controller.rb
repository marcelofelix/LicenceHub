# frozen_string_literal: true
#
# Controller to handle requisitions about accounts
class AccountsController < ApplicationController
  before_action :authorize

  def index
    @accounts = Account
                .where(parent: current_user.account)
                .paginate(page: params[:page])
                .order(:name)
  end

  def create
    @account = Account.new(account_params)
    current_user.account.add_account @account
    if @account.save
      redirect_to accounts_path
    else
      render 'new'
    end
  end

  def new
    @account = Account.new
  end

  def edit
    @account = Account.where(id: params[:id], parent: current_user.account).first
  end

  def update
    @account = Account.where(id: params[:id], parent: current_user.account).first
    if @account.update(account_params)
      redirect_to accounts_path
    else
      render 'edit'
    end
  end

  private

  def account_params
    params.require(:account).permit(:name)
  end
end
