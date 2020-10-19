# frozen_string_literal: true

class CartPolicy < ApplicationPolicy
  attr_reader :user, :cart, :params_cart

  def initialize(user, cart)
    @user = user
    @cart = cart
  end

  def show?
    @cart.user.eql? @user
  end
end
