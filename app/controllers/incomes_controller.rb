class IncomesController < ApplicationController
  before_action :set_income, except: :top
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

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end
  
  def show
    @income_amount = @income.amount
    @fixed_costs = @income.fixed_costs
    @costs_amount = @fixed_costs.pluck(:amount).sum
    @real_income = @income_amount - @costs_amount
    @costs_hash = @fixed_costs.pluck(:name, :amount).sort_by { |k, v| -v }.to_h
  end

  def edit
    @income = Income.find(params[:id])
    @fixed_costs = FixedCost.all
  end

  private

  def set_income
    @income = Income.find(params[:id])
  end

end
