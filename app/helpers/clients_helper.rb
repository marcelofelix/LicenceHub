# frozen_string_literal: true
#
# Clients helper methods
module ClientsHelper
  def select_clients(value = nil)
    values = client_options(value)
    select_tag(:client_id, values, prompt: 'Selecione um', onchange: 'this.form.submit();')
  end

  def client_options(value = nil)
    options_from_collection_for_select(Client.all, 'id', 'name', value)
  end

  def client
    @client ||= Client.find(client_id) if client_id
  end

  def client_id
    value = params[:client_id]
    return nil if value&.empty?
    value
  end
end
