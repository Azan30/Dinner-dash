class CartController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
  end

  def add
    @cart = current_user.cart
    @item = Item.find(params[:id])
    CartItem.create({cart: @cart, item: @item})
    respond_to do |format|
      format.js
    end
  end

  def remove
    @cart = current_user.cart
    @item = Item.find(params[:id])
    @cart_item = CartItem.find_by({item: @item, cart: @cart})
    @cart_item.destroy
    respond_to do |format|
      format.js
    end
  end

  def quantity
    @cart = Cart.find(params[:id])
    @cart_parameters = params[:cart]
    quantity = @cart_parameters[:quantity].to_i
    @item = Item.find(params[:item])
    @price = @item.price * quantity
    @cart_item = CartItem.find_by(cart: @cart, item: @item)
    @cart_item['quantity'] = quantity
    @cart_item.save
    respond_to do |format|
      format.js
    end
  end
end
