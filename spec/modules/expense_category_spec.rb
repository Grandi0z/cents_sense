require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  # create a user object using the factory
  let(:user) { create(:user) }

  # create a valid expense category object using the factory
  let(:expense_category) { build(:expense_category, user:) }

  # test the validations of the name attribute
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(expense_category).to be_valid
    end

    it 'is not valid without a name' do
      expense_category.name = nil
      expect(expense_category).to_not be_valid
    end

    it 'is not valid with a name shorter than 2 characters' do
      expense_category.name = 'A'
      expect(expense_category).to_not be_valid
    end

    it 'is not valid with a name longer than 250 characters' do
      expense_category.name = 'A' * 251
      expect(expense_category).to_not be_valid
    end
  end

  # test the associations with the user and expense models
  describe 'associations' do
    it 'has many expenses' do
      expect(expense_category).to have_many(:expenses)
    end
  end
end
