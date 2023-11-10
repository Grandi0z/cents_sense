require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { create(:user) }
  let(:expense_category) { create(:expense_category, user:) }
  let(:expense) { build(:expense, author: user, expense_category:) }
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(expense).to be_valid
    end

    it 'is not valid without a name' do
      expense.name = nil
      expect(expense).to_not be_valid
    end

    it 'is not valid with a name shorter than 2 characters' do
      expense.name = 'A'
      expect(expense).to_not be_valid
    end

    it 'is not valid with a name longer than 250 characters' do
      expense.name = 'A' * 251
      expect(expense).to_not be_valid
    end
  end

  describe 'amount' do
    it 'is valid with a positive decimal value' do
      expense.amount = 10.50
      expect(expense).to be_valid
    end

    it 'is not valid with a negative value' do
      expense.amount = -5.00
      expect(expense).to_not be_valid
    end

    it 'is not valid with a non-decimal value' do
      expense.amount = 'ten'
      expect(expense).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to an author' do
      expect(expense).to belong_to(:author).class_name('User')
    end

    it 'belongs to an expense category' do
      expect(expense).to belong_to(:expense_category)
    end
  end
end
