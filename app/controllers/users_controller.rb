class UsersController < ApplicationController
  def show
    @user = current_user
    @expense_categories = @user.expense_categories
  end
end
