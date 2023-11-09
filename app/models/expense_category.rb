class ExpenseCategory < ApplicationRecord
  validates :name, presence: true, length: { in: 2..250 }
  has_many :expenses
  has_one_attached :icon
end
