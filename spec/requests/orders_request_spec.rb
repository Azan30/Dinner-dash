require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:admin) { FactoryBot.create(:user) }
  let(:order) { FactoryBot.create(:order) }

  before(:each) do
    sign_in admin
  end

  describe 'GET #index' do
    it 'returns all orders' do
      get :index

      expect(response).to have_http_status(200)
    end

    it 'returns all orders' do
      get :index,  params: { status: 'Pending' }

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it 'return one order' do
      get :show, params: { id: order.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    it 'find and edit the order' do
      get :edit, params: { id: order.id, order: { status: 'Completed', bill: '500' } }

      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE #destroy' do
    it "delete the order" do
      delete :destroy, params: { id: order.id }
      expect(Order.find_by(id: order.id).present?).to eq(false)
      expect(response).to have_http_status(302)
    end
  end

  describe 'UPDATE #update' do
    it "update the order" do
      patch :update, params: { id: order.id, order: { status: 'Completed', bill: '500' } }
      updated_order = Order.find(order.id)
      expect(response.status).to eq(302)
      expect(updated_order.bill).to eq(500)
      expect(updated_order.status).to eq('Completed')
    end

    it "update the order" do
      patch :update, params: { id: order.id, order: { bill: '-1' } }
      expect(response.status).to eq(200)
    end
  end
end
