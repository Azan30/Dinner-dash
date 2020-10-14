# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.all
    @categories = Category.all
    if User.find(current_user.id).cart.nil?
      @cart = Cart.create({user: current_user })
    else
      @cart = User.find(current_user.id).cart
    end
  end
end
