class AccountsController < ApplicationController
  before_action :authorize

  def index
    @accounts = Account.where(parent: current_user.account)
  end

  def create
    binding.pry
    @account = Account.new(account_params)
    current_user.account.add_account @account
    if @account.save
      redirect_to accounts_path
    else
      render 'new'
    end
  end

  private

  def account_params
    params.require(:account).permit(:name)
  end
end
