FactoryBot.define do
  factory :line_item do
    quantity { 1 }
    order_id { Order.last.id }
    item_id { Item.last.id }
  end
end
