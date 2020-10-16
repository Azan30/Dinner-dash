# frozen_string_literal: true

module CategoriesHelper
  def quantity_value(cart, item)
    quantity = CartItem.find_by(cart: cart, item: item).quantity
    if quantity.nil?
      1
    else
      quantity
    end
  end
end
