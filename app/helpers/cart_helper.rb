# frozen_string_literal: true

module CartHelper
  def checkout_button(cart)
    unless cart.cart_items.empty?
      link_to 'Checkout', new_cart_orders_path(cart), class: 'btn btn-primary btn-lg btn-block'
    end
  end
end
