require 'rails_helper'

RSpec.describe LineItem, type: :model do
  let(:line_item) { FactoryBot.create(:line_item) }

  context 'validations' do
    context '+ve effects' do
      it 'is valid with valid attributes' do
        expect(line_item).to be_valid
      end
    end

    context '-ve effects' do
      it 'Order must be present' do
        line_item.order_id = nil
        expect(line_item).to_not be_valid
      end

      it 'Item must be present' do
        line_item.item_id = nil
        expect(line_item).to_not be_valid
      end
    end
  end

  context 'Relations' do
    it 'Line Item must belong to item' do
      line_item_order = LineItem.reflect_on_association(:item)
      expect(line_item_order.macro).to eq(:belongs_to)
    end

    it 'Line Item must belong to order' do
      line_item_order = LineItem.reflect_on_association(:order)
      expect(line_item_order.macro).to eq(:belongs_to)
    end
  end
end
