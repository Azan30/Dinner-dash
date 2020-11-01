FactoryBot.define do
  factory :cart_item do
    cart_id { Cart.last.id }
    item_id { Item.last.id }
  end
end
