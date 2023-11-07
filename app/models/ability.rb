# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, ExpenseCategory, author_id: user.id
    can :manage, Expense, author_id: user.id
  end
end
