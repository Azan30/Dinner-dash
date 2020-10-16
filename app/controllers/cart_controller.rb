# frozen_string_literal: true

class CartController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
  end

  def add
    @item = params_item
    current_user.cart.add(@item)
    respond_to do |format|
      format.js
    end
  end

  def remove
    @item = params_item
    current_user.cart.remove(@item)
    respond_to do |format|
      format.js
    end
  end

  private

  def params_item
    Item.find(params.require(:id).to_i)
  end
end
