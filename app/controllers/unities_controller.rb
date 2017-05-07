# frozen_string_literal: true
#
# Handle unity's crud request
class UnitiesController < ApplicationController
  def index
    @unities = []
    @unities = Unity.by_account(account) if account
  end

  def account_id
    value = params[:account_id]
    return nil if value&.empty?
    value
  end

  def new
    @unity = Unity.new
  end

  def create
    @unity = Unity.new(unity_params)
    @unity.account = account
    if @unity.save
      redirect_to unities_path
    else
      render 'new'
    end
  end

  helper_method :account_id

  private

  def account
    @account ||= Account.find(account_id) if account_id
  end

  def unity_params
    params.require(:unity).permit(:name)
  end
end
