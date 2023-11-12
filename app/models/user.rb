class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true, length: { in: 2..49 }
  has_many :expenses, foreign_key: 'author_id', dependent: :destroy
  has_many :expense_categories

  def admin?; end
end
