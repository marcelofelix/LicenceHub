require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  it 'test show form to create a new order' do
    user = login(create(:user))
    service = create(:service)
    unity = create(:unity)
    get :new, params: { unity_id: unity.id }
    expect(response).to render_template :new
  end

  it 'teste create a new order' do
    user = login(create(:user))
    service = create(:service)
    unity = create(:unity)
    post :create, params: {
      order: { service_id: service.id },
      unity_id: unity.id
    }
    expect(response).to redirect_to unity_path(unity)
    expect(Order.count).to eq 1
  end
end
