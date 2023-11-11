class AuthorIdToUserId < ActiveRecord::Migration[7.0]
  def change
     # Check if author_id column exists in expense_categories table
     if column_exists?(:expense_categories, :author_id)
      # Check if author_id column is the foreign key of user
      if foreign_key_exists?(:expense_categories, column: :author_id, primary_key: :id, to_table: :users)
        # Rename author_id column to user_id and keep the foreign key constraint
        rename_column :expense_categories, :author_id, :user_id
      else
        # Remove author_id column
        remove_column :expense_categories, :author_id
        # Add user_id column and set it as the foreign key of users
        add_reference :expense_categories, :user, foreign_key: true
      end
    else
      # Add user_id column and set it as the foreign key of users
      add_reference :expense_categories, :user, foreign_key: true
    end
  end
end
