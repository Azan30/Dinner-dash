# frozen_string_literal: true

module ItemsHelper
  def add_or_remove(item)
    flag = false
    current_user.cart.line_items.each do |line_items|
      flag = true if line_items.item.title == item.title
    end
    if flag
      link_to 'Remove', remove_cart_path(item), remote: true
    else
      link_to 'Add', add_cart_path(item), remote: true
    end
  end
end
