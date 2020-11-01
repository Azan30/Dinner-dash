# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { FactoryBot.create(:item) }

  context 'validations' do
    context '+ve effects' do
      it 'is valid with valid attributes' do
        expect(item).to be_valid
      end
    end

    context '-ve effects' do
      it 'is not valid without title' do
        item.title = nil
        expect(item).to_not be_valid
      end

      it 'is not valid without description' do
        item.description = nil
        expect(item).to_not be_valid
      end

      it 'is not valid value less than 1' do
        item.price = 0
        expect(item).to_not be_valid
      end
    end
  end

  context 'Relations' do
    it "should have many line items" do
      line_item = Item.reflect_on_association(:line_items)
      expect(line_item.macro).to eq(:has_many)
    end

    it "should have many orders" do
      item_order = Item.reflect_on_association(:orders)
      expect(item_order.macro).to eq(:has_many)
    end

    it "should have many items categories" do
      item_categories = Item.reflect_on_association(:item_categories)
      expect(item_categories.macro).to eq(:has_many)
    end

    it "should have many categories" do
      categories = Item.reflect_on_association(:categories)
      expect(categories.macro).to eq(:has_many)
    end

    it "should have many cart items" do
      cart_items = Item.reflect_on_association(:cart_items)
      expect(cart_items.macro).to eq(:has_many)
    end

    it "should have many cart" do
      carts = Item.reflect_on_association(:carts)
      expect(carts.macro).to eq(:has_many)
    end
  end
end
