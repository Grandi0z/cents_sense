class ChangeCategoryExpenseToExpenseCategoryId < ActiveRecord::Migration[7.0]
  def change
    remove_index :expenses, :category_expense_id
    rename_column :expenses, :category_expense_id, :expense_category_id
    add_foreign_key :expenses, :expense_categories
    add_index :expenses, :expense_category_id
  end
end
