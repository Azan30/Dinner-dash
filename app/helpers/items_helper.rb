# frozen_string_literal: true

module ItemsHelper
  def add_or_remove(item)
    flag = false
    current_user.cart.cart_items.each do |cart_item|
      flag = true if cart_item.item.id == item.id
    end
    if flag
      if item.availability
        link_to 'Remove', remove_cart_path(item), remote: true
      end
    else
      if item.availability
        link_to 'Add', add_cart_path(item), remote: true
      end
    end
  end
end
