class CartController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
  end

  def add
    @cart = current_user.cart
    @item = Item.find(params[:id])
    @testing = 'test'
    if current_user.orders.empty?
      @order = current_user.orders.create(status: 'Pending',bill: 2)
      LineItem.create({item: @item, order: @order, cart: @cart})
    else
      @order = current_user.orders.take
      LineItem.create({item: @item, order: @order, cart: @cart})
    end
    respond_to do |format|
      format.js
    end
  end

  def remove
    @cart = current_user.cart
    @item = Item.find(params[:id])
    @order = current_user.orders.take
    @line_item = LineItem.find_by({item: @item, order: @order, cart: @cart})
    @line_item.destroy
    respond_to do |format|
      format.js
    end
  end

  def change
    current_user.change_quantity(params[:item_id], params[:quantity][:qty])
    redirect_to cart_path
  end
end
