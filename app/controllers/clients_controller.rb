# frozen_string_literal: true
#
# Controller to handle requisitions about client
class ClientsController < ApplicationController
  before_action :authorize
  layout 'logged'

  def index
    @clients = Client
                .paginate(page: params[:page])
                .order(:name)
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path
    else
      render 'new'
    end
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to clients_path
    else
      render 'edit'
    end
  end

  private

  def client_params
    params.require(:client).permit(:name)
  end
end
