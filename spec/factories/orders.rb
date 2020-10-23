FactoryBot.define do
  factory :order do
    status { 'Pending' }
    bill { 500 }
    user_id { User.last.id }
  end
end
