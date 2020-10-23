FactoryBot.define do
  factory :item do
    title { Faker::Name.name }
    description { 'abc' }
    price { 123 }
  end
end
