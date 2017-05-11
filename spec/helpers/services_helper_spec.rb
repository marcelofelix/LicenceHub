# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ServicesHelper, type: :helper do
  it 'test select_services' do
    user = login(create(:user))
    create_list(:service, 2)
    helper.service_options
  end
end
