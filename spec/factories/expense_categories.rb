FactoryBot.define do
  factory :expense_category do
    name { Faker::Commerce.department }
  end
end
