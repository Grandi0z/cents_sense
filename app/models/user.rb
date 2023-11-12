class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  has_many :expense_categories
  has_many :expenses, foreign_key: 'author_id'

  def admin?; end
end
