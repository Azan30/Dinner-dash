# frozen_string_literal: true

class WelcomeController < ApplicationController
  # before_action :authenticate_user!
  def index
    @categories = Category.includes(:items)
    if user_signed_in?
      @cart = current_user.cart || current_user.create_cart
    end
  end
end
