require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.create(:order) }

  context 'validations' do
    context '+ve effects' do
      it 'is valid with valid attributes' do
        expect(order).to be_valid
      end
    end

    context '-ve effects' do
      it 'is not valid without user' do
        order.user_id = nil
        expect(order).to_not be_valid
      end

      it 'status must be present' do
        order.status = nil
        expect(order).to_not be_valid
      end

      it 'bill must be greater than 0' do
        order.bill = -1
        expect(order).to_not be_valid
      end

      it 'bill must be number' do
        order.bill = 'abc'
        expect(order).to_not be_valid
      end
    end
  end


  context 'Relations' do
    it "must belong to user" do
      order = Order.reflect_on_association(:user)
      expect(order.macro).to eq(:belongs_to)
    end

    it "should have many line_items" do
      order_item = Item.reflect_on_association(:line_items)
      expect(order_item.macro).to eq(:has_many)
    end
  end
end
