# frozen_string_literal: true
#
# Handle unity's crud request
class UnitiesController < ApplicationController
  include ClientsHelper
  before_action :authorize

  def index
    @unities = []
    @unities = Unity.where(client: client)
  end

  def show
    @unity = Unity.find_by(id: params[:id], client: client)
    redirect_to_index unless @unity
  end

  def new
    @unity = Unity.new
  end

  def create
    @unity = Unity.new(unity_params)
    @unity.client = client
    if @unity.save
      redirect_to unities_path
    else
      render 'new'
    end
  end

  def edit
    @unity = Unity.find_by(id: params[:id], client: client)
    redirect_to_index unless @unity
  end

  def update
    @unity = Unity.find(params[:id])
    if @unity.update(unity_params)
      redirect_to unities_path
    else
      render 'edit'
    end
  end

  private

  def unity_params
    params.require(:unity).permit(:name)
  end

  def redirect_to_index
    flash[:error] = 'Unidade inválida'
    redirect_to unities_path
  end
end
