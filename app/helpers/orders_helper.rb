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

  def ordered_items_status(order)
    items_title = order.items.pluck(:title)
    if items_title.empty?
      order.status = 'Canceled'
      order.save
      ['Item Has been Deleted', 'Canceled']
    else
      [items_title, order.status]
    end
  end
end
