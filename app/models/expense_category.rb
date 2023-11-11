class ExpenseCategory < ApplicationRecord
  validates :name, presence: true, length: { in: 2..250 }
  belongs_to :user, foreign_key: 'user_id'
  has_many :expenses
  has_one_attached :icon
end
