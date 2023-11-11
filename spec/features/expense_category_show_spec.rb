require 'rails_helper'

describe "Visit the show page of a user's expense category", type: :feature do
  # Logged in before running the tests
  before do
    user = FactoryBot.create(:user)
    login_as(user)
    @expense_category = FactoryBot.create(:expense_category, user:)
    @expense_category.icon.attach(io: File.open('spec/fixtures/files/avatar.jpg'), filename: 'avatar.jpg')
    @expenses = FactoryBot.create_list(:expense, 3, author: user, expense_category: @expense_category)
    visit user_expense_category_path(user, @expense_category)
  end

  it 'should display the expense category details' do
    expect(page).to have_content(@expense_category.name)
    expect(page).to have_content(remove_utc(@expense_category.updated_at))
    expect(page).to have_content(total_expense_amount(@expenses))
  end

  it 'should display the list of expenses' do
    @expenses.each do |expense|
      expect(page).to have_link(expense.name)
      expect(page).to have_content(expense.amount)
      expect(page).to have_content(remove_utc(expense.created_at))
    end
  end

  it 'should display the new expense button' do
    expect(page).to have_link('New expense', href: new_user_expense_category_expense_path(@expense_category.user, @expense_category))
  end
end
