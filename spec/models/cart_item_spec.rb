require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart_item) { FactoryBot.create(:cart_item) }

  context 'validations' do
    context '+ve effects' do
      it 'is valid with valid attributes' do
        expect(cart_item).to be_valid
      end
    end

    context '-ve effects' do
      it 'Cart must be present' do
        cart_item.cart_id = nil
        expect(cart_item).to_not be_valid
      end

      it 'Item must be present' do
        cart_item.item_id = nil
        expect(cart_item).to_not be_valid
      end
    end
  end


  context 'Relations' do
    it 'Cart Item must belong to cart' do
      cart_item = CartItem.reflect_on_association(:cart)
      expect(cart_item.macro).to eq(:belongs_to)
    end

    it 'Cart Item must belong to item' do
      cart_item = LineItem.reflect_on_association(:item)
      expect(cart_item.macro).to eq(:belongs_to)
    end
  end
end
