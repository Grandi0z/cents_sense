require 'rails_helper'

describe "Visit the show page of a user's expense category", type: :feature do
  # Logged in before running the tests
  before do
    user = FactoryBot.create(:user)
    login_as(user)
    @expense_category = FactoryBot.create(:expense_category, user:)
    @expense_category.icon.attach(io: File.open('spec/fixtures/files/avatar.jpg'), filename: 'avatar.jpg')
    @expenses = FactoryBot.create_list(:expense, 3, author: user, expense_category: @expense_category)
    visit user_path(user)
  end

  it 'should display the title of the page' do
    expect(page).to have_content 'CATEGORIES'
  end

  it 'should display the expense category details' do
    expect(page).to have_content(@expense_category.name)
    expect(page).to have_content(remove_utc(@expense_category.updated_at))
    expect(page).to have_content(total_expense_amount(@expense_category.expenses))
  end
end
