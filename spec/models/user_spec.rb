# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  context 'validations' do
    context '+ve effects' do
      it 'is valid with valid attributes' do
        expect(user).to be_valid
      end
    end

    context '-ve effects' do
      context '+ve effects' do
        it 'is not valid without a email' do
          user.email = nil
          expect(user).to_not be_valid
        end
      end

      it 'is not valid without a full_name' do
        user.full_name = nil
        expect(user).to_not be_valid
      end

      it 'is not valid without a display_name' do
        user.display_name = nil
        expect(user).to_not be_valid
      end

      it 'display name length must be minimum 2' do
        user.display_name = 'a'
        expect(user).to_not be_valid
      end

      it 'display name length must be max 32' do
        user.display_name = 'abcdefghijklmnopqrstuvwxyz1234567'
        expect(user).to_not be_valid
      end
    end
  end

  context 'method admin' do
    it 'check customer' do
      expect(user.admin?).to eq(true)
    end
  end

  context 'method customer' do
    it 'check admin' do
      expect(user.customer?).to eq(false)
    end
  end

  context 'relations' do
    it "should have many orders" do
      order = User.reflect_on_association(:orders)
      expect(order.macro).to eq(:has_many)
    end

    it "should have one cart" do
      cart = User.reflect_on_association(:cart)
      expect(cart.macro).to eq(:has_one)
    end
  end
end
