require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { FactoryBot.create(:cart) }

  context 'validations' do
    context '+ve effects' do
      it 'is valid with valid attribute' do
        expect(cart).to be_valid
      end
    end

    context '-ve effects' do
      it 'user must be present' do
        cart.user_id = nil

        expect(cart).to_not be_valid
      end
    end
  end

  context 'Relations' do
    it 'should must belongs to user' do
      cart = User.reflect_on_association(:cart)

      expect(cart.macro).to eq(:has_one)
    end
  end
end
