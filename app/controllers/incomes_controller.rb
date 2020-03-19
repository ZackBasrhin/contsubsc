class IncomesController < ApplicationController
  before_action :set_income
  def top
  end
  
  def index
    @incomes = Income.all
  end
  
  def show
    @revenue = @income.amount
    @fixed_costs = @income.fixed_costs
    @total_cost = @fixed_costs.pluck(:amount).sum
    @real_income = @revenue - @total_cost
  end

  def edit
  end

  private

  def set_income
    @income = Income.find(current_user.id)
  end

end
