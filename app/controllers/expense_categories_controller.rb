class ExpenseCategoriesController < ApplicationController
  before_action :set_user
  def new
    @expense_category = @user.expense_categories.new
  end

  def create
    @expense_category = @user.expense_categories.new(expense_category_params)
    @expense_category.user = @user
    if @expense_category.save
      flash[:success] = ' Category created '
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @expense_categories = @user.expense_categories
  end

  def show
    @current_exp_category = set_current_expense_category
    @expenses = @current_exp_category.expenses.sort_by(&:created_at).reverse
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def expense_category_params
    params.require(:expense_category).permit(:name, :icon)
  end

  def set_current_expense_category
    @current_exp_category = ExpenseCategory.includes(:expenses).find(params[:id])
  end
end
