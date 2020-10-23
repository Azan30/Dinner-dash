require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { FactoryBot.create(:category) }

  context 'validations' do
    context '+ve effects' do
      it 'is valid with valid attributes' do
        expect(category).to be_valid
      end
    end

    context '-ve effects' do
      it 'title must be present' do
        category.title = nil
        expect(category).to_not be_valid
      end
    end
  end

  context 'Relations' do
    it "category belongs to many item" do
      item_category = Category.reflect_on_association(:item_categories)
      expect(item_category.macro).to eq(:has_many)
    end
  end
end
