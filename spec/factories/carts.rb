FactoryBot.define do
  factory :cart do
    user { FactoryBot.create(:user) }
    user_id { user.id }
  end
end
