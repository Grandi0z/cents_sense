module ExpensesHelper
  def total_expense_amount(array)
    amount = 0
    array.each do |expense|
      amount += expense.amount
    end
    amount
  end
end
