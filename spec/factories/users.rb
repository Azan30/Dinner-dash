FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    full_name { 'azan' }
    display_name { 'azi' }
    password { '123456' }
    confirmed_at { Time.now }
    type { 'Admin' }
    end
end
