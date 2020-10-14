# frozen_string_literal: true

module ItemsHelper
  def add_or_remove(item)
    flag = false
    current_user.cart.cart_items.each do |line_items|
      i = line_items.item
      if i.title == item.title
        flag = true
      end
    end
    if flag
      link_to 'Remove', remove_cart_path(item), remote: true
    else
      link_to 'Add', add_cart_path(item), remote: true
    end
  end
end
