class AddAuthorColumnIdToExpenseCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :expense_categories, :author_id, :integer
    add_reference :expense_categories, :user, foreign_key: { to_table: :users }, column: :author_id
  end
end
