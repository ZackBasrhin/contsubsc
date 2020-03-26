class IncomesController < ApplicationController
  before_action :set_income, except: [:top, :new, :create]
  def top
    @income = current_user.income
  end

  def index
    @incomes = Income.all
  end

  def new
    @income = Income.new
    @fixed_costs = FixedCost.all
  end

  def edit
    @fixed_costs = FixedCost.order("amount DESC").all
  end

  def update
    if @income.update(income_params)
      redirect_to root_path, notice: '月収を更新しました'
    else
      render :edit
    end 
  end
  
  def show
    @income_amount = @income.amount
    @fixed_costs = @income.fixed_costs
    @costs_amount = @fixed_costs.pluck(:amount).sum
    @real_income = @income_amount - @costs_amount
    @costs_hash = @fixed_costs.pluck(:name, :amount).sort_by { |k, v| -v }.to_h
  end

  def create
  end

  private

  def income_params
    params.require(:income).permit(:amount, fixed_cost_ids:[])
  end

  def set_income
    @income = Income.find(params[:id])
  end

end
