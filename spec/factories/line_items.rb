FactoryBot.define do
  factory :line_item do
    quantity { 1 }
    order
    item
  end
end
