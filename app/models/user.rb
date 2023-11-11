class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true, length: { in: 2..49 }
  has_many :expenses, foreign_key: 'author_id', dependent: :destroy
  has_many :expense_categories

  def admin?; end

  def confirmation_required?
    return false if email.ends_with?("@gmail.com")
    super
  end
end
