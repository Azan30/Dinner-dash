# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_items
  has_many :items, through: :cart_items

  def add(item)
    CartItem.create({ cart: self, item: item })
  end

  def remove(item)
    @cart_item = CartItem.find_by({ cart: self, item: item })
    @cart_item.destroy!
  end

  def item_quantity_price(params)
    @item = Item.find(params[:item])
    quantity_params = params[:cart]
    quantity = quantity_params[:quantity].to_i
    @cart_item = CartItem.find_by(cart: self, item: @item)
    @cart_item['quantity'] = quantity
    @cart_item.save
    @price = @item.price * quantity
    [@price, @item]
  end
end
