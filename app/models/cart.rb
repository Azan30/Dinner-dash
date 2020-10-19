# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_items
  has_many :items, through: :cart_items

  def add(item)
    ActiveRecord::Base.transaction do
      CartItem.create({ cart: self, item: item }) if item.availability
    end
  end

  def remove(item)
    ActiveRecord::Base.transaction do
      if item.availability
        @cart_item = CartItem.find_by({ cart: self, item: item })
        @cart_item.destroy!
      end
    end
  end

  def item_quantity_price(params)
    ActiveRecord::Base.transaction do
      @item = Item.find(params[:item])
      quantity_params = params[:cart]
      quantity = quantity_params[:quantity].to_i
      @cart_item = CartItem.find_by(cart: self, item: @item)
      @cart_item['quantity'] = quantity
      @cart_item.save!
      @price = @item.price * quantity
      [@price, @item]
    end
  end
end
