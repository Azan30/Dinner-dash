FactoryBot.define do
  factory :item_category do
    item_id { Item.last.id }
    category_id { Category.last.id }
  end
end
