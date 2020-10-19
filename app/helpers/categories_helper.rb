# frozen_string_literal: true

module CategoriesHelper
  def quantity_value(cart, item)
    quantity = CartItem.find_by(cart: cart, item: item).quantity
    quantity.nil? ? 1 : quantity
  end
end
