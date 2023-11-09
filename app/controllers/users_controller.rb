class UsersController < ApplicationController
  # load_and_authorize_resource
  def show
    @user = current_user
    @expense_categories = @user.expense_categories
  end
end
