# frozen_string_literal: true
#
# List, create and update services of a Company.
# Just users should be able to call this controller
class ServicesController < ApplicationController
  before_action :authorize
  layout 'logged'

  def index
    @services = Service
                .paginate(page: params[:page])
                .order(:name)
  end

  def new
    @service  = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to services_path
    else
      render 'new'
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to services_path
    else
      render 'edit'
    end
  end

  def periodicity
    [
      ['Diario', :daily], ['Mensal', :monthly], ['Anual', :yearly]
    ]
  end

  helper_method :periodicity

  private

  def service_params
    params.require(:service).permit(:name, :periodicity)
  end
end
