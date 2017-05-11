# frozen_string_literal: true
#
# Clients helper methods
module ClientsHelper
  def select_clients(value = nil)
    values = client_options(value)
    select_tag(:client_id, values, prompt: 'Selecione um',
               onchange: 'this.form.submit();',
              class: 'form-control')
  end

  def client_options(value = nil)
    options_from_collection_for_select(Client.all, 'id', 'name', value)
  end

  def client
    if provider
      @client ||= Client.find(client_id) if client_id
    else
      @client ||= current_user.client
    end
    @client
  end

  def client_id
    value = params[:client_id]
    return nil if value&.empty?
    value
  end
end
