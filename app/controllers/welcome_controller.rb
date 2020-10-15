# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.includes(:items)
    @cart = if current_user.cart.nil?
              Cart.create({ user: current_user })
            else
              current_user.cart
            end
  end
end
