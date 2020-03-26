class FixedCostsController < ApplicationController
  before_action :set_income, except: [:edit]


  def new
    @fixed_cost = FixedCost.new
    @fixed_costs = FixedCost.all
  end

  def create
    @fixed_cost = FixedCost.new(fixed_cost_params)
    if @fixed_cost.save
      redirect_to edit_income_path(@income)
      else
      render :new
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
