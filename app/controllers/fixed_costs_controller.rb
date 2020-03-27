class FixedCostsController < ApplicationController

  def create
    @fixed_cost = FixedCost.new(fixed_cost_params)
    if @fixed_cost.save
      redirect_to root_path
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
