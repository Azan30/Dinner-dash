# frozen_string_literal: true

class CartController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    authorize @cart
  end

  def add
    @item = get_item
    if user_signed_in?
      current_user.cart.add(@item)
      respond_to do |format|
        format.js
      end
    else
      render :js => "window.location = '/users/sign_in'"
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
