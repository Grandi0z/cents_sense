FactoryBot.define do
  factory :expense do
    name { Faker::Commerce.product_name }
    amount { Faker::Commerce.price(range: 0..1000) }
    association :author, factory: :user
    association :expense_category
  end
end
