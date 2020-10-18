# frozen_string_literal: true

class CartController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
  end

  def add
    @item = get_item
    current_user.cart.add(@item)
    respond_to do |format|
      format.js
    end
  end

  def remove
    @item = get_item
    current_user.cart.remove(@item)
    respond_to do |format|
      format.js
    end
  end

  def quantity
    @cart = Cart.find(params[:id])
    @price, @item = @cart.item_quantity_price(params)
    respond_to do |format|
      format.js
    end
  end

  private

  def get_item
    Item.find(params.require(:id).to_i)
  end
end
