# frozen_string_literal: true

module ItemsHelper
  def add_or_remove(item)
    flag = false
    if user_signed_in?
      current_user.cart.cart_items.each do |cart_item|
        flag = true if cart_item.item.id == item.id
      end
      if flag
        link_to 'Remove', remove_cart_path(item), remote: true if item.availability
      else
        link_to 'Add', add_cart_path(item), remote: true if item.availability
      end
    else
      link_to 'Add', add_cart_path(item), remote: true if item.availability
    end
  end
end
