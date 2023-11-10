class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.integer :author_id, index: true
      t.integer :category_expense_id, index: true
      t.string :name
      t.decimal :amount, precision: 10, scale: 2, default: 0

      t.timestamps
    end
    add_foreign_key :expenses, :users, column: :author_id, on_delete: :cascade
    add_foreign_key :expenses, :expense_categories, column: :category_expense_id, on_delete: :cascade
  end
end
