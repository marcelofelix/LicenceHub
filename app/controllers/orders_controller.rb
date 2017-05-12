class OrdersController < ApplicationController
  include ServicesHelper
  before_action :authorize
  layout 'logged'

  def new
    @unity = Unity.find(params[:unity_id])
    @order = Order.new
  end

  def create
    @unity = Unity.find(params[:unity_id])
    @order = Order.new
    @order.service = service
    @order.unity = @unity
    @order.valid_until = DateTime.now
    @order.save
    redirect_to unity_path(@unity)
  end

  private

  def service
    @service ||= Service.find(params.dig(:order, :service_id))
  end
end
