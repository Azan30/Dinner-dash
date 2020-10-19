# frozen_string_literal: true

module CartHelper
  def checkout_button(cart)
    link_to 'Checkout', new_cart_orders_path(cart), class: 'btn btn-primary btn-lg btn-block' unless cart.cart_items.empty?
  end
end
