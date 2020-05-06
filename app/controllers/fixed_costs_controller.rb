class FixedCostsController < ApplicationController

  def create
    @fixed_cost = FixedCost.new(fixed_cost_params)
    if @fixed_cost.save
      if current_user.income
        redirect_to edit_income_path(current_user.income)
      else
        redirect_to new_income_path
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def fixed_cost_params
    params.require(:fixed_cost).permit(:name, :amount)
  end

  def set_income
    @income = Income.find(current_user.id)
  end

end
