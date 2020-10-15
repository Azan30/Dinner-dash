# frozen_string_literal: true

module OrdersHelper
  def get_class(order)
    if order.status == 'In Progress'
      'table-active'
    elsif order.status == 'Completed'
      'table-success'
    elsif order.status == 'Canceled'
      'table-danger'
    else
      'table-info'
    end
  end

  def titles(items)
    items.pluck(:title).join(', ')
  end
end