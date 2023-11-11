class AddAuthorIdToExpenseCategories < ActiveRecord::Migration[7.0]
  def change
      add_reference :expense_categories, :user, foreign_key: { to_table: :users }, column: :user_id
  end
end
