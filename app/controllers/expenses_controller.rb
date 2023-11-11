class ExpensesController < ApplicationController
  before_action :set_user
  before_action :set_expense_category
  def new
    @expense = @expense_category.expenses.new
  end

  def create
    @expense = @expense_category.expenses.new(expense_params)
    @expense.author = @user
    if @expense.save
      flash[:success] = ' Expense added '
      redirect_to user_expense_category_path(@user, @expense_category)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @expenses = @expense_category.expenses.sort_by(&:created_at).reverse
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_expense_category
    @expense_category = ExpenseCategory.includes(:expenses).find(params[:expense_category_id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
