require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  let(:item_category) { FactoryBot.create(:item_category) }

  context 'validations' do
    context '+ve effects' do
      it 'is valid with valid attributes' do
        expect(item_category).to be_valid
      end
    end

    context '-ve effects' do
      it 'Order must be present' do
        item_category.item_id = nil
        expect(item_category).to_not be_valid
      end

      it 'Item must be present' do
        item_category.category_id = nil
        expect(item_category).to_not be_valid
      end
    end
  end

  context 'Relations' do
    it 'Line Item must belong to item' do
      item_category = ItemCategory.reflect_on_association(:item)
      expect(item_category.macro).to eq(:belongs_to)
    end

    it 'Line Item must belong to order' do
      item_category = ItemCategory.reflect_on_association(:category)
      expect(item_category.macro).to eq(:belongs_to)
    end
  end
end
