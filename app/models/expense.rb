class Expense < ApplicationRecord
  validates :name, presence: true, length: { in: 2..49 }
  validates :amount, numericality: { only_decimal: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  belongs_to :expense_category, foreign_key: 'expense_category_id'
end
