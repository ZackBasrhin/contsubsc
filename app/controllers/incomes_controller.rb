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
    @fixed_cost = FixedCost.new
    @fixed_costs = FixedCost.order("name").all
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to root_path, notice: '収支の設定を登録しました'
    else
      render :edit
    end 
  end

  def edit
    @fixed_cost = FixedCost.new
    @fixed_costs = FixedCost.order("name").all
  end

  def update
    if @income.update(income_params)
      redirect_to root_path, notice: '収支の設定を更新しました'
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
    @percentage = @costs_amount*100/@income_amount
  end

  private

  def income_params
    params.require(:income).permit(:amount, fixed_cost_ids:[]).merge(user_id: current_user.id)
  end

  def set_income
    @income = Income.find(params[:id])
  end

end
