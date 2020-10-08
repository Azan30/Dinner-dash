<<<<<<< HEAD
# frozen_string_literal: true

=======
>>>>>>> Admin Functionalities as required in document
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
<<<<<<< HEAD
    items.pluck(:title).join(', ')
=======
    all_items = items.pluck(:title)
    all_items = all_items.join(', ')
>>>>>>> Admin Functionalities as required in document
  end
end
