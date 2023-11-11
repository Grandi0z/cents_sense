class CreateExpenseCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :expense_categories do |t|
      t.integer :user_id
      t.string :name
      t.string :icon

      t.timestamps
    end
      add_foreign_key :expense_categories, :users, column: :user_id, on_delete: :cascade
  end
end
