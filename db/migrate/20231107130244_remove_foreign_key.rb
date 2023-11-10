class RemoveForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_column :expense_categories, :author_id
  end
end
